import 'package:flutter/material.dart';

void returnAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Return "),
          content: Center(
              child: Text(
            "No Return",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
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
