import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';

class RemoveImageUsecase {
  final AuthRepository repositery;
  RemoveImageUsecase({required this.repositery});
  Future<void> call() async {
    try {
      // await repositery.removeImage();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
