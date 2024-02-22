import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/theme_provider.dart';
import 'package:resto_admin/features/profile/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile/data/repository/profile_repository_impl.dart';
import 'package:resto_admin/features/profile/domain/usecase/get_time_usecase.dart';
import 'package:resto_admin/features/profile/domain/usecase/set_time_usecase.dart';
import 'package:resto_admin/features/authentication/data/repository/auth_repositery_impl.dart';
import 'package:resto_admin/features/profile/domain/usecase/add_image_usecase.dart';
import 'package:resto_admin/features/profile/domain/usecase/delete_image_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  bool build() {
    //// Indicate the theme of the app
    return ref.read(themeProvider).brightness == Brightness.dark;
  }

  /// Change the theme
  void toggleTheme() {
    state = !state;
  }

  Future<void> setTime(String openingTime, ProfileEntity profileEntity) async {
    return SetTimeUsecase(repository: ref.watch(profileRepositoryProvider))(
        profileEntity);
  }

  Stream<ProfileEntity> getTime() {
    return GetTimeUsecase(repository: ref.watch(profileRepositoryProvider))();
  }

  Future<void> upload(String fileToUpload) async {
    return AddImageUsecase(
      profileRepo: ref.watch(profileRepositoryProvider),
      authRepo: ref.watch(authRepositeryProvider),
    )(
      fileToUpload,
    );
  }

  Future<void> deleteImage() async {
    await DeleteImageUsecase(
        repository: ref.watch(profileRepositoryProvider))();
  }
}

final openingTimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
final closingTimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
