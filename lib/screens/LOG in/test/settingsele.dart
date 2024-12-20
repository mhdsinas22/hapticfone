import 'package:flutter/material.dart';

class stlis extends StatefulWidget {
  const stlis({super.key});

  @override
  State<stlis> createState() => _stlisState();
}

class _stlisState extends State<stlis> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset("assest/2.jpeg"),
        Image.asset("assest/2.jpeg"),
      ],
    );
  }
}
