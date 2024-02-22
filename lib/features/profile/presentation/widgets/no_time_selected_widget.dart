import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/profile_constants/profile_page_constants.dart';
import 'package:resto_admin/features/profile/presentation/pages/edit_profile_page.dart';

class NoTimeSelectedWidget extends ConsumerWidget {
  const NoTimeSelectedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => context.push(EditProfilePage.routePath),
      child: Text(ref.watch(profilePageConstantsProvider).txtNoTimeSelected),
    );
  }
}
