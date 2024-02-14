import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_page_constants.g.dart';

class LoginPageConstants {
  final String txtHeading = "WELCOME BACK!";
  final String txtLoginBtn = "LOGIN";
  final String userName = "User Name";
  final String password = "Password";
}

@riverpod
LoginPageConstants loginPageConstants(LoginPageConstantsRef ref) {
  return LoginPageConstants();
}
