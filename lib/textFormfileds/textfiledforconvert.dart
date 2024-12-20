import 'package:flutter/material.dart';
import 'package:haptic_fone/Calacutions/calacution_functyions.dart';

// ignore: must_be_immutable
class TextfieldConvertitem extends StatelessWidget {
  TextEditingController convertitemcount;
  TextEditingController saleprcie;
  TextEditingController controllernumkeyborad;
  String hintnum;
  TextfieldConvertitem(
      {super.key,
      required this.controllernumkeyborad,
      required this.hintnum,
      required this.convertitemcount,
      required this.saleprcie});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      controller: controllernumkeyborad,
      onChanged: (value) {
        upadtedtotalprice(convertitemcount, saleprcie, hintnum, value);
      },
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        label: const Text("Item Count"),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF77B60B))),
      ),
    );
  }
}
