import 'dart:io';

import 'package:resto_admin/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductEntity entity);
  Future<void> deleteProduct(String id);
  Future<String> uploadImage(File fileUpload, String filePath);
  Future<void> deleteImage(String filePath);
}
