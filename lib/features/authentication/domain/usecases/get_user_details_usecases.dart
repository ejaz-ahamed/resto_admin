import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';

class GetUserDetailsUsecases {
  final AuthRepository repositery;

  GetUserDetailsUsecases({required this.repositery});
  Stream<UserEntity> call(String userId) async* {
    try {
      final profileStreams = repositery.getUser(userId);
      await for (final profileData in profileStreams) {
        /// If the image path is empty, then no need to create the download URL
        /// for the image
        if (profileData.imgPath.trim().isEmpty) {
          yield profileData;
        } else {
          /// Generate the download URL for the image and create the new entity
          yield profileData.copyWith(
            imgPath:
                await FirebaseStorageUtils.getDownloadUrl(profileData.imgPath),
          );
        }
      }
    } catch (e) {
      throw BaseException("Cannot get user details");
    }
  }
}
