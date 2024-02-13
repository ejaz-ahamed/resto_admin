import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showMessage(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
