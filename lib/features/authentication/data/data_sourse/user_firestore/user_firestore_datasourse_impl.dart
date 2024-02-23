import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse.dart';
import 'package:resto_admin/features/authentication/data/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_firestore_datasourse_impl.g.dart';

class UserFirestoreDatasourseImpl implements UserFirestoreDatasourse {
  final db = FirebaseFirestore.instance.collection("users").withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel userModel, options) => userModel.toFirestore(),
      );
  @override
  Stream<UserModel> getUser(String userId) async* {
    final snapshots = db.doc(userId).snapshots(includeMetadataChanges: true);
    await for (final snapshot in snapshots) {
      yield snapshot.data()!;
    }
  }

  @override
  Future<UserModel> getUserOnce(String userId) async {
    final userData = await db.doc(userId).get();
    return userData.data()!;
  }

  @override
  Future<void> setUser(UserModel userModel) async {
    final userDoc = db.doc(userModel.uid);
    await userDoc.set(userModel);
  }
}

@riverpod
UserFirestoreDatasourse userFirestoreDatasourse(
    UserFirestoreDatasourseRef ref) {
  return UserFirestoreDatasourseImpl();
}
