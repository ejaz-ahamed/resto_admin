import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/login_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    return TextButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 254),
          child: Text(
            LoginPageConstants.forgetPassword,
            style: typography.pLink,
          ),
        ));
  }
}
