import 'package:resto_admin/features/authentication/data/model/user_model.dart';

abstract class UserFirestoreDatasourse {
  Stream<UserModel> getUser(String userId);
  Future<void> setUser(UserModel userModel);
  Future<void> updateProfileImage(String imagePath,String uid);
}
