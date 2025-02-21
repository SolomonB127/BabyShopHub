import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/data/services/auth_service.dart';
import 'package:flutter/material.dart';

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
          // Replace the logout icon with a user avatar widget
          UserAvatar(
            email: currentUser,
            onSignOut: logout,
          )
        ],
      ),
      body: Center(child: Text(currentUser.toString())),
    );
  }
}

/// A custom widget that shows the user's avatar as a circle with a popup menu.
/// When tapped, it displays the user's email and a "Sign Out" option.
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
      // Display the first letter of the email in the avatar
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
        // Display the user's email as a disabled menu item
        PopupMenuItem(
          value: 'email',
          enabled: false,
          child: Text(email),
        ),
        const PopupMenuDivider(),
        // Sign out menu item
        const PopupMenuItem(
          value: 'signOut',
          child: Text('Sign Out'),
        ),
      ],
    );

  }
}
