import 'package:flutter/material.dart';

class SearchTesting extends StatelessWidget {
  final TextEditingController controller;
  const SearchTesting({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(width: 1)),
          prefixIcon: const Icon(Icons.search, size: 20),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          label: const Text(
            "What you want",
            style: TextStyle(fontSize: 15, color: Color(0xFFD9D9D9)),
          ),
        ),
      ),
    );
  }
}
