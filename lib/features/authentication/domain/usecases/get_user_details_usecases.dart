import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';

class GetProfileImageUsecases {
  final AuthRepositery repositery;

  GetProfileImageUsecases({required this.repositery});
  Stream<UserEntity> call() async* {
    try {
      final profileStreams = repositery.getProfileImage();
      await for (final profileData in profileStreams) {
        /// If the image path is empty, then no need to create the download URL
        /// for the image
        if (profileData.imgPath.trim().isEmpty) {
          yield profileData;
        } else {
          /// Generate the download URL for the image and create the new entity
          yield UserEntity(
              imgPath: await FirebaseStorageUtils.getDownloadUrl(
                  profileData.imgPath));
        }
      }
    } catch (e) {
      throw BaseException("somthing went wrong $e");
    }
  }
}
