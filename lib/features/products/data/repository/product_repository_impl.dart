import 'dart:io';
import 'dart:math';

import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource_impl.dart';
import 'package:resto_admin/features/products/data/datasources/product_storage_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/product_storage_datasource_impl.dart';
import 'package:resto_admin/features/products/data/models/product_addon_model.dart';
import 'package:resto_admin/features/products/data/models/product_model.dart';
import 'package:resto_admin/features/products/data/models/product_type_model.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductFireStoreDataSource dataSource;
  final ProductStorageDataSource storageDataSource;
  ProductRepositoryImpl({
    required this.dataSource,
    required this.storageDataSource,
  });
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
    await dataSource.add(ProductModel(
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
    return dataSource.remove(id);
  }

  @override
  Future<String> upload(File fileUpload, String filePath) {
    return storageDataSource.add(fileUpload, filePath);
  }

  @override
  Stream<List<ProductEntity>> getAll() async* {
    final data = dataSource.getAll();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final product in docs)
          ProductEntity(
            name: product.name,
            imagePath: product.imagePath,
            description: product.description,
            id: product.id,
            types: [
              for (final type in product.types)
                ProductTypeEntity(
                  name: type.name,
                  price: type.price,
                  id: type.id,
                )
            ],
            addOns: [
              for (final add in product.addOns)
                ProductAddOnEntity(
                  name: add.name,
                  id: add.id,
                  price: add.price,
                )
            ],
          )
      ];
    }
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
    storageDataSource: ref.watch(productStorageDataSourceProvider),
    dataSource: ref.watch(productFireStoreDataSourceProvider),
  );
}
