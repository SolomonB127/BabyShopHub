import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        title: const Text(
          "Terms and Conditions",
          style: TextStyle(color: AppColors.surface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("General Terms and Conditions of Use of the Marketplace for Buyers and Sellers", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.00, color: AppColors.textPrimary),),
            Divider(thickness: 5.00,color: AppColors.divider,)
          ],
        ),
      ),
    );
  }
}