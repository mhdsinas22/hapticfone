import 'package:flutter/material.dart';

class homest extends StatefulWidget {
  const homest({super.key});

  @override
  State<homest> createState() => _homestState();
}

class _homestState extends State<homest> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset("assest/4.jpeg"),
        Image.asset("assest/4.jpeg"),
      ],
    );
  }
}
