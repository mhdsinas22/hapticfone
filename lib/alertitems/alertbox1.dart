import 'package:flutter/material.dart';
import 'package:haptic_fone/core/const/appcolors.dart';
import 'package:haptic_fone/login_page/login_screen.dart';

void alertbox1(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          iconColor: Appcolors.limegreen,
          title: const Text(
            "Are you sure",
            style: TextStyle(color: Appcolors.limegreen),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Appcolors.limegreen),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Appcolors.limegreen),
              child: const Text("Sure"),
            ),
          ],
        );
      });
}
