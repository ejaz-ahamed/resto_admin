import 'dart:io';

import 'package:resto_admin/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<void> setTime(ProfileEntity profileEntity);
  Stream<ProfileEntity> getTime();
   Future<String>upload(File fileToUpload);
  Future<void>deleteImage();
}

