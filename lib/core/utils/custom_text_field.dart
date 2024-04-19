import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final String? initialValue;
  final TextEditingController? controller;
  final int? maxLines;

  const CustomTextField(
      {required this.labelName,
      this.initialValue,
      this.maxLines,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
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
