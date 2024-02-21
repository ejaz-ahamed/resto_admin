import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/login_page_constants/login_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/submit_button_widget.dart';
import 'package:resto_admin/core/widgets/login_textfield_widget.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = "/loginPage";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

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
            padding: EdgeInsets.only(left: spacer.space_300),
            child: Row(
              children: [
                Text(
                  constants.txtSubHeading,
                  style: typography.h500.copyWith(color: colors.textSubtlest),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: spacer.space_500, bottom: spacer.space_200),
            child: LoginTextfieldWidget(
              hintText: constants.txtUserName,
              prefixIcon: Icon(Icons.person, color: colors.textSubtlest),
              controller: emailController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: spacer.space_600),
            child: LoginTextfieldWidget(
              hintText: constants.txtPassword,
              prefixIcon: Icon(
                Icons.fingerprint,
                color: colors.textSubtlest,
              ),
              controller: passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacer.space_300),
            child: ElevatedButtonWidget(
                buttonText: constants.txtLoginBtn,
                borderColor: colors.primary,
                filledColor: colors.primary,
                textColor: colors.secondary,
                onPressed: () {
                  ref
                      .read(authenticationProvider.notifier)
                      .login(emailController.text, passwordController.text);
                }),
          ),
        ],
      ),
    );
  }
}
