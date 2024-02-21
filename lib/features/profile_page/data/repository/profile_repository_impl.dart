import 'package:resto_admin/features/profile_page/data/data_source/profile_firestore_data_source.dart';
import 'package:resto_admin/features/profile_page/data/data_source/profile_firestore_data_source_impl.dart';
import 'package:resto_admin/features/profile_page/data/model/profile_model.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileFirestoreDataSource dataSource;
  ProfileRepositoryImpl({required this.dataSource});
  @override
  Future<void> setTime(ProfileEntity profileEntity) async {
    final model = ProfileModel(
      openingTime: profileEntity.openingTime,
      closingTime: profileEntity.closingTime,
    );
    await dataSource.setTime(model);
  }

  

  @override
  Stream<ProfileEntity> getTime() async* {
    final models = dataSource.getTime();

    await for (final profileModel in models) {
      yield ProfileEntity(
          openingTime: profileModel.openingTime,
          closingTime: profileModel.closingTime);
    }
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(
      dataSource: ref.watch(profileFirestoreDataSourceProvider));
}
