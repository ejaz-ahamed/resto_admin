import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/snack_bar_utils.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/authentication/presentation/pages/login_page.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';

class EditPasswordPage extends HookConsumerWidget {
  static const routePath = '/editpasswordpage';
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final constants = ref.watch(profilePageContstantsProvider);
    final hintText = ref.watch(profilePageContstantsProvider).txtHintenterHere;
    final appTheme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: appTheme.colors.secondary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              appTheme.spaces.space_700,
            ),
            child: AppBarWidget(title: constants.txtEditPassword)),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: appTheme.spaces.space_400,
              horizontal: appTheme.spaces.space_300),
          child: Column(
            children: [
              const SizedBox32Widget(),
              TextFieldWidget(
                  enabled: true,
                  textFieldTitle: constants.txtNewPassword,
                  hintText: hintText,
                  controller: newPasswordController),
              const SizedBox32Widget(),
              TextFieldWidget(
                  enabled: true,
                  textFieldTitle: constants.txtConfirmPassword,
                  hintText: hintText,
                  controller: confirmPasswordController),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: () {
            if (newPasswordController.text == confirmPasswordController.text) {
              ref
                  .read(authenticationProvider.notifier)
                  .updatePassword(newPasswordController.text);
              context.go(LoginPage.routePath);
              newPasswordController.clear();
              confirmPasswordController.clear();
            } else {
              SnackBarUtils.showMessage('incorrect password');
              newPasswordController.clear();
              confirmPasswordController.clear();
            }
          },
        ),
      ),
    );
  }
}
