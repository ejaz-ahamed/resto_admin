import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../login_page_constants.g.dart';

class LoginPageConstants {
  final String heading = "WELCOME BACK!";
  final String buttonText = "LOGIN";
  final String userName = "User Name";
  final String password = "Password";
}

@riverpod
LoginPageConstants loginPageConstants(LoginPageConstantsRef ref) {
  return LoginPageConstants();
}
