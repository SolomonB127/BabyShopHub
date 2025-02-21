import 'package:flutter/material.dart';

/// A reusable search input field widget.
/// Displays a text field with a hint and a suffix icon.
class SearchTile extends StatelessWidget {
  final String hintText;
  final IconButton icon;

  const SearchTile({
    super.key,
    required this.hintText,
    required this.icon,
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
