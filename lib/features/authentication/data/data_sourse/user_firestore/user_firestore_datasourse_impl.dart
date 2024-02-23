import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    final snapshots = db.doc(userId).snapshots();
    await for (final snapshot in snapshots) {
      yield snapshot.data()!;
    }
  }

  @override
  Future<void> setUser(UserModel userModel) async {
    final userDoc = db.doc(userModel.uid);
    await userDoc.set(userModel);
  }

  @override
  Future<void> updateProfileImage(String imagePath, String uid) async {
    // await db.doc(uid).update({'imgPath': imagePath});
    await FirebaseStorage.instance
        .ref()
        .child("profile/profile_image")
        .delete();
    await FirebaseStorage.instance
        .ref()
        .child("profile/profile_image")
        .putFile(File(imagePath));
  }
}

@riverpod
UserFirestoreDatasourse userFirestoreDatasourse(
    UserFirestoreDatasourseRef ref) {
  return UserFirestoreDatasourseImpl();
}
