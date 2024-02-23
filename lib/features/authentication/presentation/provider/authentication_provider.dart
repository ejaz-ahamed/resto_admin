import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/snack_bar_utils.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/authentication/data/repository/auth_repositery_impl.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/usecases/get_user_details_usecases.dart';
import 'package:resto_admin/features/authentication/domain/usecases/login_usecases.dart';
import 'package:resto_admin/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:resto_admin/features/authentication/domain/usecases/remove_image_usecase.dart';
import 'package:resto_admin/features/authentication/domain/usecases/update_password_usecase.dart';
import 'package:resto_admin/features/authentication/domain/usecases/set_profile_usecases.dart';
import 'package:resto_admin/features/authentication/domain/usecases/update_profile_image_usecase.dart';
import 'package:resto_admin/features/authentication/presentation/pages/login_page.dart';
import 'package:resto_admin/features/profile_page/data/repository/profile_repository_impl.dart';
import 'package:resto_admin/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  void build() {}

  Future<void> login(String email, String password) async {
    try {
      await LoginUsecase(repositery: ref.watch(authRepositeryProvider))(
          email, password);
      Future.sync(() =>
          MyApp.navigatorKey.currentContext!.go(BottomNaviWidget.routePath));
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }

  Future<void> logout() async {
    try {
      await LogOutUsecase(repositery: ref.watch(authRepositeryProvider))();
      Future.sync(
          () => MyApp.navigatorKey.currentContext!.go(LoginPage.routePath));
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }

  Future<void> setProfileData(
      {required String imagePath,
      required String name,
      required String uid}) async {
    await UpdateUserProfileUsecases(
            repositery: ref.watch(authRepositeryProvider),
            profileRepository: ref.watch(profileRepositoryProvider))(
        imagePath: imagePath, name: name, uid: uid);
  }

  Future<void> updatePassword(String newPassword) async {
    await UpdatePasswordUsecase(repositery: ref.watch(authRepositeryProvider))(
        newPassword);
  }

  Future<void> removeImage() async {
    await RemoveImageUsecase(repositery: ref.watch(authRepositeryProvider))();
  }

  Future<void> updateProfileImage(String imagePath, String uid) async {
    await UpdateProfileImageUsecase(
            repository: ref.watch(authRepositeryProvider))(
        imagePath: imagePath, uid: uid);
  }
}

/// Provider for the user data
@riverpod
Stream<UserEntity> userProfileStream(UserProfileStreamRef ref, String userId) {
  return GetUserDetailsUsecases(repositery: ref.watch(authRepositeryProvider))(
      userId);
}
