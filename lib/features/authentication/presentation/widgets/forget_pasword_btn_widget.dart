import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/login_page_constants.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          LoginPageConstants.forgetPassword,
          style: TextStyle(color: Colors.blue),
        ));
  }
}
