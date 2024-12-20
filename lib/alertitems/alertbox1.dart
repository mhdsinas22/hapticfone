import 'package:flutter/material.dart';
import 'package:haptic_fone/login_page/login_screen.dart';

void alertbox1(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          iconColor: Color(0xFF77B60B),
          title: Text(
            "Are you sure",
            style: TextStyle(color: Color(0xFF77B60B)),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text("Sure"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            ),
          ],
        );
      });
}
