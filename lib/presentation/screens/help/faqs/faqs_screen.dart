import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'question': 'How can I place an order?',
        'answer': 'Simply select your favorite items, add them to your cart, and proceed to checkout. Our secure payment process ensures a smooth experience.'
      },
      {
        'question': 'How do I track my order?',
        'answer': 'Once your order is shipped, you will receive an email with a tracking number. Use it on our website to view real-time updates on your delivery status.'
      },
      {
        'question': 'What payment methods are accepted?',
        'answer': 'We accept Visa, MasterCard, American Express, and PayPal. All transactions are secure and encrypted.'
      },
      {
        'question': 'How do I cancel or modify my order?',
        'answer': 'Orders can be canceled or modified within 1 hour of placement. Please contact our support team for assistance.'
      },
      {
        'question': 'How do I update my shipping address?',
        'answer': 'You can update your shipping address from your account settings or during the checkout process before finalizing your order.'
      },
      {
        'question': 'What if my order arrives damaged or defective?',
        'answer': 'If your order is damaged or defective, please contact our support immediately for a replacement or refund.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequently Asked Questions", style: TextStyle(color: AppColors.surface),),
        centerTitle: true,
        backgroundColor: AppColors.primaryLight
      ),
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final faq = faqs[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  faq['question']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      faq['answer']!,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
