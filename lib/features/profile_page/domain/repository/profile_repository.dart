
import 'dart:io';

import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';

abstract class ProfileRepository{
  Future<void>addOpeningTime(ProfileEntity profileEntity);
  Future<void>addClosingTime(ProfileEntity profileEntity);
  Future<String>upload(File fileToUpload);
}