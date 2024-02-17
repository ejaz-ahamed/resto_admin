import 'package:resto_admin/features/authentication/data/model/user_model.dart';

abstract class UserFirestoreDatasourse {
  Stream<UserModel> getUserDetails(String uid);
  Future<void> updateUserDetails(UserModel userData);
}
