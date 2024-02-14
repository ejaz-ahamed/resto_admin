import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_page_constants.g.dart';

class LoginPageConstants {
  final String txtHeading = "WELCOME BACK!";
  final String txtSubHeading = "Login to your account";
  final String txtLoginBtn = "LOGIN";
  final String txtUserName = "User Name";
  final String txtPassword = "Password";
}

@riverpod
LoginPageConstants loginPageConstants(LoginPageConstantsRef ref) {
  return LoginPageConstants();
}
