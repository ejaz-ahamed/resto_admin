import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class RemoveImageUsecase{
  final AuthRepositery repositery;
  RemoveImageUsecase({required this.repositery});
  Future<void>call()async{
    try {
      await repositery.removeImage();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}