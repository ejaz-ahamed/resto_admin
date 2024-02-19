import 'dart:io';

import 'package:resto_admin/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductEntity entity);
  Future<void> deleteProduct(String id);
  Future<String> upload(File fileUpload, String filePath);
  Future<void> deleteStorage(String fileName);
  Stream<List<ProductEntity>> getAll();
  Future<ProductEntity> getById(String id);
}
