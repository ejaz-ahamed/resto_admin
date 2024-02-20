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
      if (imagePath.startsWith('http')) {
        final data = await repository.getById(id);
        imagePath = data.imagePath;
      } else {
        final data = await repository.getById(id);
        await repository.deleteStorage(data.name);
        imagePath = await repository.upload(File(imagePath), name);
      }

      await repository.update(CategoryEntity(
        id: id,
        imagePath: imagePath,
        name: name,
      ));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
