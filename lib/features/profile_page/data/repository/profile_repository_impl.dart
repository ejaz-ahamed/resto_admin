import 'package:resto_admin/features/profile_page/data/datasource/profile_firestore_datasource.dart';
import 'package:resto_admin/features/profile_page/data/datasource/profile_firestore_datasource_impl.dart';
import 'package:resto_admin/features/profile_page/data/model/profile_model.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileFirestoreDataSource dataSource;
  ProfileRepositoryImpl({required this.dataSource});
  @override
  Future<void> addOpeningTime(ProfileEntity entity) async {
    final model = ProfileModel(
        openingTime: entity.openingTime, closingTime: entity.closingTime);
    await dataSource.addOpeningTime(model);
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(
      dataSource: ref.watch(profileFirestoreDataSourceProvider));
}
