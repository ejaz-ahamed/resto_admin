import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class GetUserDetailsUsecases {
  final AuthRepositery repositery;

  GetUserDetailsUsecases({required this.repositery});
  Stream<UserEntity> call(String uid) {
    try {
      return repositery.getUserDetails(uid);
    } catch (e) {
      throw BaseException("error");
    }
  }
}
