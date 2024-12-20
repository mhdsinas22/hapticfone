import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final double width;

  const SearchField({required this.controller, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        fillColor: const Color(0xFF77B60B),
        filled: true,
        prefixIcon: Icon(Icons.search, color: Colors.white, size: width * 0.05),
        label: Text(
          "What You Want?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.04,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF77B60B)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
