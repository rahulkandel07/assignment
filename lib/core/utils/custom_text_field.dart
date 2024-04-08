import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final String? initialValue;
  final TextEditingController? controller;

  const CustomTextField(
      {required this.labelName, this.initialValue, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelName,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
