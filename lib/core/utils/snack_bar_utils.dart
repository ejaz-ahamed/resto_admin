import 'package:flutter/material.dart';
import 'package:resto_admin/main.dart';

class SnackBarUtils {
  static void showMessage(String content) {
    MyApp.scaffoldMessengerKey.currentState!
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
