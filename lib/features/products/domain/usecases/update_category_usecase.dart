import 'dart:io';

import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';

final class UpdateCategoryUseCase {
  final CategoryRepository repository;
  UpdateCategoryUseCase({required this.repository});

  Future<void> call(
      {required String id,
      required String imagePath,
      required String name}) async {
    try {
      await repository.deleteStorage(imagePath);

      final upaloadedPath = await repository.upload(File(imagePath), name);

      await repository.update(CategoryEntity(
        id: id,
        imagePath: upaloadedPath,
        name: name,
      ));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
