import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth/firebase_auth_datasourse.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/firebase_auth/firebase_auth_datasourse_impl.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse_impl.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_storage/user_storage_datasource.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_storage/user_storage_datasource_impl.dart';
import 'package:resto_admin/features/authentication/data/model/user_model.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repositery_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSourse dataSourse;
  final UserFirestoreDatasourse userDataSourse;
  final UserStorageDataSource storageDataSource;

  AuthRepositoryImpl(
      {required this.userDataSourse,
      required this.dataSourse,
      required this.storageDataSource});
  @override
  Future<void> login(String email, String password) async {
    await dataSourse.login(email, password);
  }

  @override
  Future<void> logout() async {
    await dataSourse.logout();
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    dataSourse.updatePassword(newPassword);
  }

  @override
  Stream<UserEntity> getUser(String userId) async* {
    final data = userDataSourse.getUser(userId);
    await for (final model in data) {
      yield UserEntity(
        imgPath: model.imgPath,
        name: model.name,
        uid: model.uid,
      );
    }
  }

  @override
  Future<void> setUser(UserEntity userEntity) async {
    final model = UserModel(
      name: userEntity.name,
      uid: userEntity.uid,
      imgPath: userEntity.imgPath,
    );

    await userDataSourse.setUser(model);
  }

  @override
  Future<void> deleteImage(String userId) async {
    await storageDataSource.delete(userId);
  }

  @override
  Future<String> uploadImage(String userId, String imagePath) {
    return storageDataSource.upload(userId, imagePath);
  }
}

@riverpod
AuthRepository authRepositery(AuthRepositeryRef ref) {
  return AuthRepositoryImpl(
      dataSourse: ref.read(firebaseAuthDataSourseProvider),
      userDataSourse: ref.read(userFirestoreDatasourseProvider),
      storageDataSource: ref.read(userStorageDataSourceProvider));
}
