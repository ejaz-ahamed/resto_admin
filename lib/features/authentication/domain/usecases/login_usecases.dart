import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class LoginUsecase {
  final AuthRepositery repositery;

  LoginUsecase({required this.repositery});

  Future<void> call(String email, String password) async {
    try {
      await repositery.loginAuth(email, password);
    } on BaseException catch (e) {
      throw AuthenticationFailException(e.message);
    } catch (e) {
      throw BaseException('Login Failed');
    }
  }
}
