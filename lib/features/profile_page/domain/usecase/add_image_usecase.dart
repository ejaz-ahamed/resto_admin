import 'dart:io';

import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/profile_page/domain/repository/profile_repository.dart';

class AddImageUsecase {
  final ProfileRepository repository;
  AddImageUsecase({required this.repository});
  Future<String> call(String fileToUpload) async {
    try {
      return repository.upload(File(fileToUpload));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
