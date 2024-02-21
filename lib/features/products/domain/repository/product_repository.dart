import 'dart:io';

import 'package:resto_admin/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductEntity entity, String id);
  Future<void> deleteProduct(String id);
  Future<String> upload(File fileUpload, String filePath);
  Future<void> update(ProductEntity updatedEntity);
  Stream<List<ProductEntity>> getAll(String categoryId);
  Future<ProductEntity> getById(String id);
  Future<void> deleteStorage(String fileName);
}
