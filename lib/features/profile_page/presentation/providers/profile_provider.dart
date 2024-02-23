import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/theme_provider.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/data/repository/profile_repository_impl.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/get_time_usecase.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/set_time_usecase.dart';
import 'package:resto_admin/features/authentication/data/repository/auth_repositery_impl.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/add_image_usecase.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/delete_image_usecase.dart';
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
    return SetTimeUsecase(repository: ref.read(profileRepositoryProvider))(
        profileEntity);
  }

  Stream<ProfileEntity> getTime() {
    return GetTimeUsecase(repository: ref.read(profileRepositoryProvider))();
  }

  Future<void> upload({
    required String fileToUpload,
    required String uid,
  }) {
    return AddImageUsecase(
        profileRepo: ref.read(profileRepositoryProvider),
        authRepo: ref.read(authRepositeryProvider))(
      fileToUpload: fileToUpload,
      uid: uid,
    );
  }

  Future<void> deleteImage(String userId) async {
    await DeleteImageUsecase(
        repository: ref.read(profileRepositoryProvider),
        authRepo: ref.read(authRepositeryProvider))(userId);
  }
}

final openingTimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
final closingTimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
