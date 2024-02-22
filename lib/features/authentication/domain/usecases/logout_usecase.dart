import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';

class LogOutUsecase {
  final AuthRepository repositery;

  LogOutUsecase({required this.repositery});
  Future<void> call() async {
    try {
      await repositery.logout();
    } on BaseException catch (e) {
      throw AuthenticationFailException(e.message);
    } catch (e) {
      throw BaseException('Logout Failed');
    }
  }
}
