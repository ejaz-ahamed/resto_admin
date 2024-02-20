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

  Future<String> upload(String fileToUpload) async {
    return AddImageUsecase(repository: ref.watch(profileRepositoryProvider))(
        fileToUpload);
  }

  Future<void> deleteImage() async {
    await DeleteImageUsecase(
        repository: ref.watch(profileRepositoryProvider))();
  }
}
