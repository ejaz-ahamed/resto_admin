import 'dart:io';

import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class UpdatedProductUseCase {
  final ProductRepository repository;
  UpdatedProductUseCase({required this.repository});
  Future<void> call({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
  }) async {
    try {
      if (imagePath.startsWith('http')) {
        final data = await repository.getById(id);
        imagePath = data.imagePath;
      } else {
        final data = await repository.getById(id);
        await repository.deleteStorage(data.name);
        imagePath = await repository.upload(File(imagePath), name);
      }
      await repository.update(
        ProductEntity(
          types: types,
          addOns: addOns,
          id: id,
          categoryId: categoryId,
          name: name,
          imagePath: imagePath,
          description: description,
        ),
      );
    } catch (e) {
      throw BaseException('Cannot update product Details');
    }
  }
}
