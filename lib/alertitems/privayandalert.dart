import 'package:flutter/material.dart';

void Pricvay(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Privacy & Policy "),
          content: Text(
              "At [haptic.fone], your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your information when you use our services. By accessing or using our services, you agree to the terms of this Privacy Policy."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            ),
          ],
        );
      });
}
