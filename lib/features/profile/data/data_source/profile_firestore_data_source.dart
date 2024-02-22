import 'package:resto_admin/features/profile/data/model/profile_model.dart';

abstract class ProfileFirestoreDataSource {
  Future<void> setTime(ProfileModel profileModel);
  Stream<ProfileModel> getTime();
}

