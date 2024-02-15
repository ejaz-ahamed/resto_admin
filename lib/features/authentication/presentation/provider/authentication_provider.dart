import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/snack_bar_utils.dart';
import 'package:resto_admin/features/authentication/data/repositery/auth_repositery_impl.dart';
import 'package:resto_admin/features/authentication/domain/usecases/login_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  void build() {}

  Future<void> loginAuth(String email, String password) async {
    try {
      await LoginUsecase(repositery: ref.watch(authRepositeryProvider))(
          email, password);
    } on BaseException catch (e) {
      SnackBarUtils.showMessage(e.message);
    }
  }
}
