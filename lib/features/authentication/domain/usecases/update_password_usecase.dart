import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class UpdatePasswordUsecase{
  final AuthRepositery repositery;
  UpdatePasswordUsecase({required this.repositery});
  Future<void>call(String newPassword)async{
    try {
      await repositery.updatePassword(newPassword);
    }on BaseException catch (e) {
      throw AuthenticationFailException(e.toString());
    }catch (e){
      throw BaseException('update password failed');
    }
  }
}