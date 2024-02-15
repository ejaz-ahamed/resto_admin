abstract class AuthenticationDataSourse {
  Future<void> firebaseAuth(String email, String password);
  Future<void> logout();
}
