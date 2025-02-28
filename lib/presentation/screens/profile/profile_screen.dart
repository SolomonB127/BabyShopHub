import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/data/services/auth_service.dart';
import 'package:baby_shop_hub/presentation/screens/order-tracking/order_tracking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baby_shop_hub/provider/order_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authService = AuthService();

  // Logout function
  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve user email
    final currentUser = authService.getCurrentUserEmail();

    if (currentUser == null) {
      return const SizedBox();
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
        actions: [
          UserAvatar(
            email: currentUser,
            onSignOut: logout,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email: $currentUser", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text(
                "Order History",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Consumer<OrderProvider>(
                builder: (context, orderProvider, child) {
                  if (orderProvider.orders.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("No orders yet"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orderProvider.orders.length,
                    itemBuilder: (context, index) {
                      final order = orderProvider.orders[index];
                      return Card(
                        child: ListTile(
                          title:
                              Text("Order ${order.id.substring(0, 8)}"),
                          subtitle: Text(
                            "Date: ${order.date.toLocal().toString().split(' ')[0]}\nStatus: ${order.status}",
                          ),
                          trailing:
                              Text("\$${order.total.toStringAsFixed(2)}"),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => OrderTrackingScreen(order: order)));
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A custom widget that shows the user's avatar as a circle with a popup menu.
class UserAvatar extends StatelessWidget {
  final String email;
  final VoidCallback? onSignOut;

  const UserAvatar({
    super.key,
    required this.email,
    this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: CircleAvatar(
        backgroundColor: AppColors.primary,
        child: Text(
          email.isNotEmpty ? email.substring(0, 1).toUpperCase() : '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onSelected: (value) {
        if (value == 'signOut' && onSignOut != null) {
          onSignOut!();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'email',
          enabled: false,
          child: Text(email),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'signOut',
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}
