import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Options", style: TextStyle(color: AppColors.surface),),
        centerTitle: true,
        backgroundColor: AppColors.primaryLight,
      ),
      backgroundColor: AppColors.surface,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.credit_card,
                  size: 40, color: AppColors.success),
              title: const Text("Credit & Debit Cards",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: const Text(
                  "We accept Visa, MasterCard, and American Express. Enjoy secure and fast transactions."),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.account_balance_wallet,
                  size: 40, color: AppColors.success),
              title: const Text("PayPal",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: const Text("Pay safely with your PayPal account."),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.attach_money,
                  size: 40, color: AppColors.success),
              title: const Text("Other Payment Options",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: const Text(
                  "For installment plans or financing options, please contact our support team."),
            ),
          ),
        ],
      ),
    );
  }
}
