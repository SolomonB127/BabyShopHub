// File: lib/presentation/screens/checkout/order_tracking_screen.dart
import 'package:flutter/material.dart';
import 'package:baby_shop_hub/core/models/order.dart';
import 'package:baby_shop_hub/core/theme/app_colors.dart';

class OrderTrackingScreen extends StatelessWidget {
  final Order order;
  const OrderTrackingScreen({Key? key, required this.order}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order ${order.id.substring(0, 8)} Tracking"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Date: ${order.date.toLocal().toString().split(' ')[0]}"),
            Text("Total: \$${order.total.toStringAsFixed(2)}"),
            Text("Status: ${order.status}"),
            // Additional dummy tracking details can be added here.
          ],
        ),
      ),
    );
  }
}
