import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class DeleteImageUsecase {
  final ProfileRepository repository;
  final AuthRepository authRepo;

  DeleteImageUsecase({
    required this.repository,
    required this.authRepo,
  });
  Future<void> call(String userId) async {
    try {
      final userDetails = await authRepo.getUser(userId).first;

      await repository.deleteImage(userDetails.imgPath);
      await authRepo.updateProfileImage('', userDetails.uid);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
