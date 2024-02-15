import 'package:firebase_auth/firebase_auth.dart';
import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth_datasourse.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_auth_datasourse_impl.g.dart';

class AuthenticationDataSourseImpl implements AuthenticationDataSourse {
  final FirebaseAuth _auth;

  AuthenticationDataSourseImpl(this._auth);
  @override
  Future<void> firebaseAuth(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw AuthenticationFailException('Invalid mail');
      } else if (e.code == 'user-not-found') {
        throw AuthenticationFailException('user not found');
      } else {
        throw AuthenticationFailException("${e.message}");
      }
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}

@riverpod
AuthenticationDataSourse authenticationDataSourse(
    AuthenticationDataSourseRef ref) {
  return AuthenticationDataSourseImpl(FirebaseAuth.instance);
}
