import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class LogOutUsecase {
  final AuthRepositery repositery;

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
