import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';

abstract class AuthRepositery {
  Future<void> loginAuth(String email, String password);
  Future<void> logout();
  Future<void> updateUserDetails(UserEntity userData);
  Stream<UserEntity> getUserDetails(String uid);
}
