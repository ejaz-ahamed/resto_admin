import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_firestore/user_firestore_datasourse.dart';
import 'package:resto_admin/features/authentication/data/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_firestore_datasourse_impl.g.dart';

class UserFirestoreDatasourseImpl implements UserFirestoreDatasourse {
  final db = FirebaseFirestore.instance
      .collection("admin_profile")
      .withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel userModel, options) => userModel.toFirestore(),
      );
  @override
  Stream<UserModel> getProfileImage() async* {
    final snapshots = db.doc('profile_image').snapshots();
    await for (final snapshot in snapshots) {
      yield snapshot.data()!;
    }
  }

  @override
  Future<void> setProfileImage(UserModel userModel) async {
    final userDoc = db.doc('profile_image');
    await userDoc.set(userModel);
  }

  @override
  Future<void> removeImage() async {
    await FirebaseFirestore.instance
        .collection("admin_profile")
        .doc('profile_image')
        .delete();
  }
}

@riverpod
UserFirestoreDatasourse userFirestoreDatasourse(
    UserFirestoreDatasourseRef ref) {
  return UserFirestoreDatasourseImpl();
}
