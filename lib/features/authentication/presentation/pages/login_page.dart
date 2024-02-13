import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/login_page_constants/login_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/submit_button_widget.dart';
import 'package:resto_admin/core/widgets/login_textfield_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(loginPageConstantsProvider);
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: spacer.space_300),
            child: Row(
              children: [
                Text(
                  constants.txtHeading,
                  style: typography.h800,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: spacer.space_250, bottom: spacer.space_200),
            child: LoginTextfieldWidget(
                hintText: constants.userName,
                prefixIcon: Icon(Icons.person, color: colors.textSubtlest)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: spacer.space_600),
            child: LoginTextfieldWidget(
              hintText: constants.password,
              prefixIcon: Icon(
                Icons.fingerprint,
                color: colors.textSubtlest,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacer.space_300),
            child: ElevatedButtonWidget(
                buttonText: constants.txtLoginBtn,
                borderColor: colors.primary,
                filledColor: colors.primary,
                textColor: colors.secondary,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
