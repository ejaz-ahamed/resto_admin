import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/snack_bar_utils.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/authentication/data/repositery/auth_repositery_impl.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/usecases/get_user_details_usecases.dart';
import 'package:resto_admin/features/authentication/domain/usecases/login_usecases.dart';
import 'package:resto_admin/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:resto_admin/features/authentication/domain/usecases/update_user_details_usecases.dart';
import 'package:resto_admin/features/authentication/presentation/pages/login_page.dart';
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
      MyApp.navigatorKey.currentContext!.go(BottomNaviWidget.routePath);
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }

  Future<void> logout() async {
    try {
      await LogOutUsecase(repositery: ref.watch(authRepositeryProvider))();
      MyApp.navigatorKey.currentContext!.go(LoginPage.routePath);
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }

  Stream<UserEntity> getUserDetails(String uid) async* {
    try {
      yield* GetUserDetailsUsecases(
          repositery: ref.watch(authRepositeryProvider))(uid);
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }

  Future<void> updateUserDetails(UserEntity userEntity) async {
    try {
      await UpdateuserDetailsUsecases(
          repositery: ref.watch(authRepositeryProvider));
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }
}
