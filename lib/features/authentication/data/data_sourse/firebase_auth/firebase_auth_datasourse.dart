abstract class FirebaseAuthDataSourse {
  Future<void> login(String email, String password);
  Future<void> logout();
}
