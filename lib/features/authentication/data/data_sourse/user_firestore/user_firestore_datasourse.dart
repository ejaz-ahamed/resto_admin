import 'package:resto_admin/features/authentication/data/model/user_model.dart';

abstract class UserFirestoreDatasourse {
  Stream<UserModel> getProfileImage();
  Future<void> setProfileImage(UserModel userModel);
}
