import 'dart:io';

import 'package:resto_admin/features/profile_page/data/data_source/profile_firestore_data_source.dart';
import 'package:resto_admin/features/profile_page/data/data_source/profile_firestore_data_source_impl.dart';
import 'package:resto_admin/features/profile_page/data/data_source/profile_storage_datasource.dart';
import 'package:resto_admin/features/profile_page/data/data_source/profile_storage_datasource_impl.dart';
import 'package:resto_admin/features/profile_page/data/model/profile_model.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileFirestoreDataSource profileFirestoreDataSource;
  final ProfileStorageDataSource storageDataSource;
  ProfileRepositoryImpl(
      {required this.profileFirestoreDataSource,
      required this.storageDataSource});
  @override
  Future<void> addOpeningTime(ProfileEntity profileEntity) async {
    final model = ProfileModel(
        openingTime: profileEntity.openingTime,
        closingTime: profileEntity.closingTime);
    await profileFirestoreDataSource.setOpeningTime(model);
  }

  @override
  Future<void> addClosingTime(ProfileEntity profileEntity) async {
    final model = ProfileModel(
        openingTime: profileEntity.openingTime,
        closingTime: profileEntity.closingTime);
    await profileFirestoreDataSource.setClosingTime(model);
  }

  @override
  Future<String> upload(File fileToUpload) async {
    return storageDataSource.addImage(fileToUpload);
  }
  
  @override
  Future<void> deleteImage()async {
    await storageDataSource.deleteImage();
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(
      profileFirestoreDataSource: ref.watch(profileFirestoreDataSourceProvider),
      storageDataSource: ref.watch(profileStorageDataSourceProvider));
}
