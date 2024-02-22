import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/profile/domain/repository/profile_repository.dart';

class DeleteImageUsecase{
  final ProfileRepository repository;
  DeleteImageUsecase({required this.repository});
  Future<void>call()async{
    try {
      await repository.deleteImage();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}