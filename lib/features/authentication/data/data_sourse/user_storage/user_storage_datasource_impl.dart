import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:resto_admin/features/authentication/data/data_sourse/user_storage/user_storage_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_storage_datasource_impl.g.dart';

class UserStorageDataSourceImpl implements UserStorageDataSource {
  @override
  Future<void> delete(String userId) async {
    await FirebaseStorage.instance.ref().child('user/$userId').delete();
  }

  @override
  Future<String> upload(String userId, String imagePath) async {
    final ref = FirebaseStorage.instance.ref().child('user/$userId');
    await ref.putFile(File(imagePath));
    return ref.fullPath;
  }
}

@riverpod
UserStorageDataSource userStorageDataSource(UserStorageDataSourceRef ref){
  return UserStorageDataSourceImpl();
}
