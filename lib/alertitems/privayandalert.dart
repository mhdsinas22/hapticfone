import 'package:flutter/material.dart';
import 'package:haptic_fone/core/const/appcolors.dart';

// ignore: non_constant_identifier_names
void Privacy(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Privacy & Policy "),
          content: const Text(
              "At [haptic.fone], your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your information when you use our services. By accessing or using our services, you agree to the terms of this Privacy Policy."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Appcolors.limegreen),
              child: const Text("Cancel"),
            ),
          ],
        );
      });
}
