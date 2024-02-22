import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:resto_admin/features/profile/data/data_source/profile_storage_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_storage_datasource_impl.g.dart';

class ProfileStorageDataSourceImpl implements ProfileStorageDataSource{
   final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> addImage(File image, )async {
    await storageRef.child('profile/profile_image').putFile(image);
    final filePath = storageRef.child('profile/profile_image').fullPath;
    return filePath;
  }
  
  @override
  Future<void> deleteImage()async {
    await storageRef.child('profile/profile_image').delete();
  }
}
@riverpod
ProfileStorageDataSource profileStorageDataSource(ProfileStorageDataSourceRef ref){
  return ProfileStorageDataSourceImpl();
}