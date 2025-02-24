import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconButton icon;
  final Function(String) onChanged;

  const SearchTile({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
