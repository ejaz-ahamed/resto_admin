import 'dart:io';

import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/authentication/domain/repositery/auth_repositery.dart';
import 'package:resto_admin/features/authentication/domain/usecases/set_profile_image_usecases.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class AddImageUsecase {
  final ProfileRepository profileRepo;
  final AuthRepositery authRepo;

  AddImageUsecase({
    required this.profileRepo,
    required this.authRepo,
  });

  Future<void> call(String fileToUpload) async {
    try {
      final String uploadedPath;

      /// If the image path is empty, then we need to remove the image
      /// from backend
      if (fileToUpload.trim().isEmpty) {
        uploadedPath = '';
      } else {
        uploadedPath = await profileRepo.upload(File(fileToUpload));
      }

      await SetProfileImageUsecases(
          repositery: authRepo,
          profileRepository: profileRepo)(imagePath: uploadedPath);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
