import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final String? initialValue;

  const CustomTextField(
      {required this.labelName, this.initialValue, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelName,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
