import 'package:resto_admin/features/authentication/data/repositery/auth_repositery_impl.dart';
import 'package:resto_admin/features/profile_page/data/repository/profile_repository_impl.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/add_image_usecase.dart';
import 'package:resto_admin/features/profile_page/domain/usecase/delete_image_usecase.dart';
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
