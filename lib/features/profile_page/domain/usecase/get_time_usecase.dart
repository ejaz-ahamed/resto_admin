import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class GetTimeUsecase {
  final ProfileRepository repository;
  GetTimeUsecase({required this.repository});
  Stream<ProfileEntity> call() {
    try {
      return repository.getTime();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
