
import 'package:resto_admin/features/profile_page/data/model/profile_model.dart';

abstract class ProfileFirestoreDataSource{
  Future<void>setOpeningTime(ProfileModel profileModel);
  Future<void>setClosingTime(ProfileModel profileModel);

}