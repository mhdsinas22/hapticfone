import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextformLoignPage extends StatelessWidget {
  TextEditingController controllrt = TextEditingController();
  final String label;
  final bool obsursetext;
  final String? Function(String?)? validator;
  TextformLoignPage({
    super.key,
    required this.controllrt,
    required this.label,
    required this.obsursetext,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: TextFormField(
            obscureText: obsursetext,
            controller: controllrt,
            validator: validator,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 182, 42, 11)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF77B60B)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF77B60B)),
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(
                  label,
                  style: TextStyle(color: Colors.grey),
                )),
          ),
        ),
      ),
    );
  }
}
