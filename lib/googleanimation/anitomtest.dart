import 'dart:core';
import 'package:flutter/material.dart';
import 'package:haptic_fone/screens/HOME/bottomuser.dart';
import 'package:intl/intl.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current date and time.
    final formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Sale Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date & Time: $formattedDateTime',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Bottomuser(selecteddindex: 1)));
              },
              child: Text("Done"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF77B60B),
                  foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
