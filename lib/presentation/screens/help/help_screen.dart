import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: Colors.orange,
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
            const SectionTitle(title: 'About Jumia'),
            const ListItem(title: 'Jumia Services'),
            const ListItem(title: 'Help Center'),
            const ListItem(title: 'Privacy Policy'),
            const Divider(thickness: 1, height: 20),
            const SectionTitle(title: 'Settings'),
            const ListItem(title: 'Push Notifications'),
            const ListItem(title: 'Country', trailingText: 'NIGERIA'),
            const ListItem(title: 'Language', trailingText: 'ENGLISH'),
            const Divider(thickness: 1, height: 20),
            const SectionTitle(title: 'App Info'),
            const ListItem(
                title: 'App Version 16.9.0', trailingText: 'UP TO DATE'),
            const ListItem(title: 'Cache Used: 0.97 MB', trailingText: 'CLEAR'),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final String? trailingText;
  const ListItem({super.key, required this.title, this.trailingText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: trailingText != null
          ? Text(trailingText!,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14))
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
