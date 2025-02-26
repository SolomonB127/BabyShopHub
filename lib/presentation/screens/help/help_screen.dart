import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/screens/help/help-center/help_center.dart';
import 'package:flutter/material.dart';

import '../../widgets/specific/list_item.dart';
import '../../widgets/specific/section_tile.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.surface),
        ),
        backgroundColor: AppColors.primaryLight,
      ),
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: AppColors.primaryDark,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Start Live Chat',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SectionTitle(title: 'About BabyShop'),
            ListItem(title: 'Help Center', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenter()));
            },),
            const ListItem(title: 'Privacy Policy'),
            const Divider(thickness: 1, height: 20),
            const SectionTitle(title: 'Settings'),
            const ListItem(title: 'Country', trailingText: 'NIGERIA'),
            const ListItem(title: 'Language', trailingText: 'ENGLISH'),
            const Divider(thickness: 1, height: 20),
            const SectionTitle(title: 'App Info'),
            const ListItem(
                title: 'App Version 1.0.0', trailingText: 'UP TO DATE'),
          ],
        ),
      ),
    );
  }
}