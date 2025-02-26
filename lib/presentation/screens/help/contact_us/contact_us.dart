import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us", style: TextStyle(color: AppColors.surface),),
        centerTitle: true,
        backgroundColor: AppColors.primaryLight
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
              leading: const Icon(Icons.email,
                  size: 40, color: AppColors.primaryDark),
              title: const Text("Email Us",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: const Text("support@babyshophub.com"),
              onTap: () {
                // TODO: Implement email launch or copy-to-clipboard functionality
              },
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.phone,
                  size: 40, color: AppColors.primaryDark),
              title: const Text("Call Us",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: const Text("+1 234 567 8900"),
              onTap: () {
                // TODO: Implement phone dialer launch
              },
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.access_time,
                  size: 40, color: AppColors.primaryDark),
              title: const Text("Working Hours",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: const Text("Mon-Fri, 9 AM - 6 PM"),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Optionally, navigate to a simple message form or launch email app
              },
              icon: const Icon(Icons.send, color: Colors.white,),
              label: const Text("Send Us a Message", style: TextStyle(color: AppColors.surface),),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
