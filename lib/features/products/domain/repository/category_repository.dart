import 'dart:io';

import 'package:resto_admin/features/products/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<void> add(CategoryEntity entity);
  Future<void> remove(String id);
  Future<void> update(CategoryEntity updatedEntity);
  Stream<List<CategoryEntity>> getAll();
  Future<String> upload(File fileToUpload, String filePath);
  Future<void> deleteStorage(String fileName);
  Future<CategoryEntity> getById(String id);
}
