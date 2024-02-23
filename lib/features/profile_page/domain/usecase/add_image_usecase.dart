import 'dart:io';

import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repository/auth_repository.dart';
import 'package:resto_admin/features/authentication/domain/usecases/update_profile_image_usecase.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class AddImageUsecase {
  final ProfileRepository profileRepo;
  final AuthRepository authRepo;

  AddImageUsecase({
    required this.profileRepo,
    required this.authRepo,
  });

  Future<void> call({required String fileToUpload, required String uid}) async {
    try {
      final String uploadedPath;

      /// If the image path is empty, then we need to remove the image
      /// from backend
      if (fileToUpload.trim().isEmpty) {
        uploadedPath = '';
      } else {
        uploadedPath = await profileRepo.upload(File(fileToUpload));
      }

      await UpdateProfileImageUsecase(repository: authRepo)(
          imagePath: uploadedPath, uid: uid);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
