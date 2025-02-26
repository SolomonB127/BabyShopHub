import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: AppColors.surface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "Privacy Policy",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16.0),
            // Introduction
            Text(
              "Welcome to Baby E-commerce App. We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data in a manner similar to trusted platforms like Jumia. By using our app, you agree to the terms outlined below.",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16.0),
            // Information Collection
            Text(
              "Information Collection",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "We collect personal details such as your name, email address, phone number, and shipping address when you register or make a purchase. Additionally, non-personal information may be collected automatically through cookies and analytics tools.",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16.0),
            // Use of Information
            Text(
              "Use of Information",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "The information we collect is used to process your orders, provide customer support, improve our services, and enhance your shopping experience. We do not sell or share your personal information with third parties except with trusted partners who assist us in operating our app.",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16.0),
            // Data Security
            Text(
              "Data Security",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "We implement a range of security measures to protect your data from unauthorized access or disclosure. However, please note that no method of transmission over the internet is entirely secure.",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16.0),
            // Policy Changes
            Text(
              "Changes to This Policy",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "We may update this Privacy Policy from time to time. Any changes will be posted on this page, and your continued use of the app will constitute your acceptance of such changes. We recommend reviewing this policy periodically.",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24.0),
            // Bullet point linking to Terms and Conditions
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/terms');
              },
              child: Row(
                children: const [
                  Icon(Icons.arrow_forward, size: 20, color: AppColors.primary),
                  SizedBox(width: 8.0),
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
