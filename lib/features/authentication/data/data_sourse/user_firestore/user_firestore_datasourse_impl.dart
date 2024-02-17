import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse.dart';
import 'package:resto_admin/features/authentication/data/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_firestore_datasourse_impl.g.dart';

class UserFirestoreDatasourseImpl implements UserFirestoreDatasourse {
  final db = FirebaseFirestore.instance.collection("User_Data").withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel userModel, options) => userModel.toFirestore(),
      );
  @override
  Stream<UserModel> getUserDetails(String uid) async* {
    final snapshots = db.snapshots();

    await for (final snapshot in snapshots) {
      yield snapshot.docs.first.data();
    }
  }

  @override
  Future<void> updateUserDetails(UserModel userData) async {
    final userDoc = db.doc(userData.uid);
    await userDoc.set(userData);
  }

  +
  ++























































































































































  
}

@riverpod
UserFirestoreDatasourse userFirestoreDatasourse(
    UserFirestoreDatasourseRef ref) {
  return UserFirestoreDatasourseImpl();
}
