import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController _controller = TextEditingController();

  void _onSubmit() {
    String inputText = _controller.text;

    // Check if input is a valid number
    if (inputText.isEmpty || int.tryParse(inputText) == null) {
      // Show Snackbar if the input is not a valid number
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid number'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Check if the number has at least 10 digits
      if (inputText.length < 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter at least 10 digits'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Proceed with your action here if valid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Input is valid, proceeding with action...'),
            duration: Duration(seconds: 2),
          ),
        );

        // Example action (e.g., navigate to another screen)
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Validation with Snackbar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType:
                  TextInputType.number, // Ensure only number input is allowed
              decoration: InputDecoration(
                labelText: 'Enter number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExamplePage(),
  ));
}
