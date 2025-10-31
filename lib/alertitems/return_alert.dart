import 'package:flutter/material.dart';

void returnAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Return "),
          content: const Center(
              child: Text(
            "No Return",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF77B60B)),
              child: const Text("Cancel"),
            ),
          ],
        );
      });
}
