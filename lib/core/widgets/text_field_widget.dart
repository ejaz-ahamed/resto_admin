import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
