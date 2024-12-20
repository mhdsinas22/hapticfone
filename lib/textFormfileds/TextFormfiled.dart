import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFilekeybioramdnumddd extends StatelessWidget {
  TextEditingController controllernumkeyborad;
  String hintnum;
  TextFormFilekeybioramdnumddd({
    super.key,
    required this.controllernumkeyborad,
    required this.hintnum,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      controller: controllernumkeyborad,
      decoration: InputDecoration(
          hintText: hintnum,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
