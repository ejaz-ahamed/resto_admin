import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/data/repository/profile_repository_impl.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/get_time_usecase.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/set_time_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  bool build() {
    //// Indicate the theme of the app
    return false;
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
}

final openingTimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
final closingTimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
 