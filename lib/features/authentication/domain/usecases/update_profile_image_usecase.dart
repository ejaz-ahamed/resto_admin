import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';

final class UpdateProfileImageUsecase {
  final AuthRepository repository;

  UpdateProfileImageUsecase({required this.repository});
  Future<void> call({required String imagePath, required String uid}) async {
    try {
      imagePath = imagePath.trim();
      final userData = await repository.getUser(uid).first;

      if (userData.imgPath.isNotEmpty) {
        await repository.deleteImage(uid);
      }

      if (imagePath.isNotEmpty) {
        imagePath = await repository.uploadImage(uid, imagePath);
      }
      await repository.setUser(
          UserEntity(imgPath: imagePath, name: userData.name, uid: uid));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
