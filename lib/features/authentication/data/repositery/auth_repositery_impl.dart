import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth/firebase_auth_datasourse.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth/firebase_auth_datasourse_impl.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse_impl.dart';
import 'package:resto_admin/features/authentication/data/model/user_model.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repositery_impl.g.dart';

class AuthRepositeryImpl implements AuthRepositery {
  final FirebaseAuthDataSourse dataSourse;
  final UserFirestoreDatasourse userDataSourse;

  AuthRepositeryImpl({required this.userDataSourse, required this.dataSourse});
  @override
  Future<void> login(String email, String password) async {
    await dataSourse.login(email, password);
  }

  @override
  Future<void> logout() async {
    await dataSourse.logout();
  }

  @override
  Stream<UserEntity> getUserDetails(String uid) async* {
    final data = userDataSourse.getUserDetails(uid);
    await for (final model in data) {
      yield UserEntity(
          uid: model.uid, name: model.name, imgPath: model.imgPath);
    }
  }

  @override
  Future<void> updateUserDetails(UserEntity userEntity) async {
    final model = UserModel(
        uid: userEntity.uid,
        name: userEntity.name,
        imgPath: userEntity.imgPath);
    await userDataSourse.updateUserDetails(model);
  }
}

@riverpod
AuthRepositery authRepositery(AuthRepositeryRef ref) {
  return AuthRepositeryImpl(
      dataSourse: ref.watch(firebaseAuthDataSourseProvider),
      userDataSourse: ref.watch(userFirestoreDatasourseProvider));
}
