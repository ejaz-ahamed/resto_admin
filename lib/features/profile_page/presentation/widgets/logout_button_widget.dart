import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';

class LogoutButtonWidget extends ConsumerWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(profilePageConstantsProvider);

    final appTheme = AppTheme.of(context);
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: AppTheme.of(context).colors.secondary,
            title: Consumer(
              builder: (context, ref, child) => Column(
                children: [
                  TextButton(
                      onPressed: () {
                        ref.read(authenticationProvider.notifier).logout();
                      },
                      child: Text(
                        constants.txtLogOut,
                        style: AppTheme.of(context).typography.h500,
                      )),
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        constants.txtCancel,
                        style: AppTheme.of(context).typography.h500,
                      )),
                ],
              ),
            )),
      ),
      child: Text(
        constants.txtLogOut,
        style: appTheme.typography.h400,
      ),
    );
  }
}
