import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repositery;

  LoginUsecase({required this.repositery});

  Future<void> call(String email, String password) async {
    try {
      await repositery.login(email, password);
    } on BaseException catch (e) {
      throw AuthenticationFailException(e.message);
    } catch (e) {
      throw BaseException('Login Failed');
    }
  }
}
