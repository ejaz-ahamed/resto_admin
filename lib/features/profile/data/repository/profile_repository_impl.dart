import 'package:resto_admin/features/profile/data/data_source/profile_firestore_data_source.dart';
import 'package:resto_admin/features/profile/data/data_source/profile_firestore_data_source_impl.dart';
import 'dart:io';
import 'package:resto_admin/features/profile/data/data_source/profile_storage_datasource.dart';
import 'package:resto_admin/features/profile/data/data_source/profile_storage_datasource_impl.dart';
import 'package:resto_admin/features/profile/data/model/profile_model.dart';
import 'package:resto_admin/features/profile/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile/domain/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileFirestoreDataSource profileFirestoreDataSource;
  final ProfileStorageDataSource storageDataSource;
  ProfileRepositoryImpl(
      {required this.profileFirestoreDataSource,
      required this.storageDataSource});
  @override
  @override
  Future<void> setTime(ProfileEntity profileEntity) async {
    final model = ProfileModel(
      openingTime: profileEntity.openingTime!,
      closingTime: profileEntity.closingTime!,
    );
    await profileFirestoreDataSource.setTime(model);
  }

  @override
  Stream<ProfileEntity> getTime() async* {
    final models = profileFirestoreDataSource.getTime();

    await for (final profileModel in models) {
      yield ProfileEntity(
          openingTime: profileModel.openingTime,
          closingTime: profileModel.closingTime);
    }
  }

  @override
  Future<void> deleteImage() {
    return storageDataSource.deleteImage();
  }

  @override
  Future<String> upload(File fileToUpload) {
    return storageDataSource.addImage(fileToUpload);
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(
      profileFirestoreDataSource: ref.watch(profileFirestoreDataSourceProvider),
      storageDataSource: ref.watch(profileStorageDataSourceProvider));
}
