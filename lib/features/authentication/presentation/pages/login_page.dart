import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/login_page_constants.dart';
import 'package:resto_admin/core/constants/textfield_widget_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/submit_button_widget.dart';
import 'package:resto_admin/core/widgets/textfield_widget.dart';
import 'package:resto_admin/features/authentication/presentation/widgets/forget_pasword_btn_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 132, top: 200, bottom: 20),
            child: Text(
              LoginPageConstants.heading,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: TextfieldWidget(
                hintText: TextfieldConstants.userName,
                prefixIcon: Icon(Icons.person, color: colors.textSubtlest)),
          ),
          TextfieldWidget(
            hintText: TextfieldConstants.password,
            prefixIcon: Icon(
              Icons.fingerprint,
              color: colors.textSubtlest,
            ),
            suffixIcon: Icon(Icons.remove_red_eye),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ForgetPasswordButtonWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButtonWidget(
                buttonText: LoginPageConstants.buttonText,
                borderColor: colors.primary,
                filledColor: colors.primary,
                textColor: colors.text,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
