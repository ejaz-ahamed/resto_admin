abstract class FirebaseAuthDataSourse {
  Future<void> firebaseAuth(String email, String password);
  Future<void> logout();
}
