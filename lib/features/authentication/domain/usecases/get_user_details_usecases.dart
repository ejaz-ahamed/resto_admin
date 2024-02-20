import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class GetUserDetailsUsecases {
  final AuthRepositery repositery;

  GetUserDetailsUsecases({required this.repositery});
  Stream<UserEntity> call() async* {
    try {
      final profileStreams = repositery.getProfileImage();
      await for (final stream in profileStreams) {
        yield UserEntity(
            imgPath: await FirebaseStorageUtils.getDownloadUrl(stream.imgPath));
      }
    } catch (e) {
      throw BaseException("somthing went wrong $e");
    }
  }
}
