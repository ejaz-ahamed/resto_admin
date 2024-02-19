import 'dart:io';

import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource_impl.dart';
import 'package:resto_admin/features/products/data/datasources/product_storage_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/product_storage_datasource_impl.dart';
import 'package:resto_admin/features/products/data/models/product_addon_model.dart';
import 'package:resto_admin/features/products/data/models/product_model.dart';
import 'package:resto_admin/features/products/data/models/product_type_model.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductFireStoreDataSource datasource;
  final ProductStorageDataSource storageDataSource;
  ProductRepositoryImpl(
      {required this.datasource, required this.storageDataSource});
  @override
  Future<void> addProduct(ProductEntity entity) async {
    List<ProductTypeModel> typeEntity = [
      for (final type in entity.types)
        ProductTypeModel(name: type.name, price: type.price, id: type.id)
    ];
    List<ProductAddonModel> addOnEntity = [
      for (final addOn in entity.addOns!)
        ProductAddonModel(id: addOn.id, name: addOn.name, price: addOn.price)
    ];
    await datasource.add(ProductModel(
        categoryId: entity.categoryId,
        id: entity.id,
        imagePath: entity.imagePath,
        name: entity.name,
        description: entity.description,
        types: [
          for (final d in typeEntity)
            ProductTypeModel(
              name: d.name,
              price: d.price,
              id: d.id,
            )
        ],
        addOns: [
          for (final c in addOnEntity)
            ProductAddonModel(
              name: c.name,
              id: c.id,
              price: c.price,
            )
        ]));
  }

  @override
  Future<void> deleteProduct(String id) async {
    return datasource.remove(id);
  }

  @override
  Future<String> uploadImage(File fileUpload, String filePath) {
    return storageDataSource.add(fileUpload, filePath);
  }

  @override
  Future<void> deleteImage(String filePath) {
    return storageDataSource.delete(filePath);
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
      storageDataSource: ref.watch(productStorageDataSourceProvider),
      datasource: ref.watch(productFireStoreDataSourceProvider));
}
