import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Createpin extends StatefulWidget {
  Function(Map<String, dynamic>) oncreatepin;
  Createpin({super.key, required this.oncreatepin});

  @override
  State<Createpin> createState() => _CreatepinState();
}

class _CreatepinState extends State<Createpin> {
  TextEditingController enterpin = TextEditingController();

  @override
  void dispose() {
    enterpin.dispose();
    super.dispose();
  }

  // Method to save PIN
  void savePin() async {
    String pin = enterpin.text;

    // Validate the PIN (check if it is not empty and is 4 digits long)
    if (pin.isEmpty) {
      // Show error Snackbar if PIN is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a PIN."),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else if (pin.length != 4) {
      // Show error Snackbar if PIN is not 4 digits
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("PIN must be 4 digits long."),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Save the valid PIN to Hive
      var box = await Hive.openBox('appBox');
      await box.put('pin', pin); // Save PIN to Hive
      widget.oncreatepin({'pin': pin});

      // Show success Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("PIN created successfully!"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // Go back after saving the PIN
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text("Create Pin")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assest/5.png"),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: enterpin,
                decoration: InputDecoration(hintText: "Enter Pin"),
              ),
            ),
            ElevatedButton(
              onPressed: savePin, // Call savePin when the button is pressed
              child: Text("Save Pin"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
