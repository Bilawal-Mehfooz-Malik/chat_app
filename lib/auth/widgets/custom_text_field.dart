import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.autoCorrect = false,
    this.inputType = TextInputType.text,
  });

  final String text;
  final bool autoCorrect;
  final bool obscureText;
  final TextInputType inputType;
  final FormFieldValidator validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      validator: validator,
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
