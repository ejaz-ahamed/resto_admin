import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';

final class UpdateProfileImageUsecase{
  final AuthRepository repository;
  UpdateProfileImageUsecase({required this.repository});
  Future<void>call({required String  imagePath, required String uid})async{
    try {
      await repository.updateProfileImage(imagePath, uid);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}