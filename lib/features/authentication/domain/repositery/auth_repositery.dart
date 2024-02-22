import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';

abstract class AuthRepositery {
  Future<void> updatePassword(String newPassword);
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> setProfileImage(UserEntity userEntity);
  Stream<UserEntity> getProfileImage();
  Future<void> removeImage();
}
