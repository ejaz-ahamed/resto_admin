import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class UpdateuserDetailsUsecases {
  final AuthRepositery repositery;

  UpdateuserDetailsUsecases({required this.repositery});
  Future<void> call(UserEntity userEntity) async {
    try {
      await repositery.setProfileImage(userEntity);
    } catch (e) {
      throw BaseException("somthing went wrong");
    }
  }
}
