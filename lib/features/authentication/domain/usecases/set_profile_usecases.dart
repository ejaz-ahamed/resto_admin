import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class UpdateUserProfileUsecases {
  final AuthRepository repositery;
  final ProfileRepository profileRepository;

  UpdateUserProfileUsecases(
      {required this.repositery, required this.profileRepository});
  Future<void> call({
    required String imagePath,
  }) async {
    try {
      await repositery.setUser(
        UserEntity(
          imgPath: imagePath,
          name: '',
          uid: '',
        ),
      );
    } catch (e) {
      throw BaseException("Cannot set user image");
    }
  }
}
