import 'package:firebase_auth/firebase_auth.dart';
import 'package:resto_admin/core/exceptions/authentication/authentication_exception.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth/firebase_auth_datasourse.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_auth_datasourse_impl.g.dart';

class FirebaseAuthDataSourseImpl implements FirebaseAuthDataSourse {
  final FirebaseAuth _auth;

  FirebaseAuthDataSourseImpl(this._auth);
  @override
  Future<void> login(String email, String password) async {
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
    await FirebaseAuth.instance.signOut();
  }
  
  @override
  Future<void> updatePassword(String newPassword)async {
   final user = FirebaseAuth.instance.currentUser;
   await user!.updatePassword(newPassword);
  }
}

@riverpod
FirebaseAuthDataSourse firebaseAuthDataSourse(FirebaseAuthDataSourseRef ref) {
  return FirebaseAuthDataSourseImpl(FirebaseAuth.instance);
}
