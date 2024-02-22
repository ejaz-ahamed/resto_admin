import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/profile/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile/domain/repository/profile_repository.dart';

class SetTimeUsecase {
  final ProfileRepository repository;
  SetTimeUsecase({required this.repository});
  Future<void> call(ProfileEntity profileEntity) async {
    try {
      repository.setTime(profileEntity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
