import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String? trailingText;
  final void Function()? onTap;
  const ListItem({super.key, required this.title, this.trailingText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: trailingText != null
            ? Text(trailingText!,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14))
            : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
