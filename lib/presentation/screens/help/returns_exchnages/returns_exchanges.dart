import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReturnsExchangesScreen extends StatelessWidget {
  const ReturnsExchangesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Returns & Exchanges", style: TextStyle(color: AppColors.surface),),
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
                  "Easy Returns",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "If you're not completely satisfied with your purchase, you can return the item within 30 days of delivery. Please ensure items are in their original condition.",
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
                SizedBox(height: 16),
                Text(
                  "Exchanges",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "If you need to exchange an item for a different size or color, please contact our support team for a hassle-free exchange process.",
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
