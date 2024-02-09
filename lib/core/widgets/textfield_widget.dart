import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  final Widget suffixIcon;
  const TextfieldWidget(
      {super.key, required this.hintText, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          iconColor: Colors.grey,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
