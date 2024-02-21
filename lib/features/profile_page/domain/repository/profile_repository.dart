import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<void> setTime(ProfileEntity profileEntity);
  Stream<ProfileEntity> getTime();
}
