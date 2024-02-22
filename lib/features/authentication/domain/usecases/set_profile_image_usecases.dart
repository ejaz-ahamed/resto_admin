import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class SetProfileImageUsecases {
  final AuthRepositery repositery;
  final ProfileRepository profileRepository;

  SetProfileImageUsecases(
      {required this.repositery, required this.profileRepository});
  Future<void> call({required String imagePath}) async {
    try {
      await repositery.setProfileImage(UserEntity(imgPath: imagePath));
    } catch (e) {
      throw BaseException("Cannot set user image");
    }
  }
}
