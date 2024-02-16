abstract class AuthRepositery{
  Future<void>loginAuth(String email,String password);
  Future <void>logout();
}