import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ShippingDeliveryScreen extends StatelessWidget {
  const ShippingDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping & Delivery", style: TextStyle(color: AppColors.surface),),
        centerTitle: true,
        backgroundColor: AppColors.primaryLight,
      ),
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Standard Shipping",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Enjoy free standard shipping on orders over \$50. Your items will be processed within 1-2 business days and delivered within 3-5 business days.",
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
                SizedBox(height: 16),
                Text(
                  "Expedited Shipping",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "For faster delivery, choose our expedited shipping option. Additional charges may apply, and orders are typically delivered within 1-2 business days.",
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
