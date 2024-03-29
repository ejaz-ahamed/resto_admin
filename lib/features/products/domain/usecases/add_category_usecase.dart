import 'dart:io';

import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';

final class AddCategoryUseCase {
  final CategoryRepository repository;
  AddCategoryUseCase({required this.repository});

  Future<void> call({
    required String id,
    required String imagePath,
    required String name,
  }) async {
    try {
      final upaloadedPath = await repository.upload(File(imagePath), name);

      await repository.add(CategoryEntity(
        id: id,
        imagePath: upaloadedPath,
        name: name,
      ));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
