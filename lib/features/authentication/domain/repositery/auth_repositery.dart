abstract class AuthRepositery{
  Future<void>loginAuth(String email,String password);
  Future <void>logout();
  Future<void>updatePassword(String newPassword);
}