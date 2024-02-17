import 'package:resto_admin/features/authentication/data/model/user_model.dart';

abstract class FirebaseAuthDataSourse {
  Future<void> firebaseAuth(String email, String password);
  Future<void> logout();
}
