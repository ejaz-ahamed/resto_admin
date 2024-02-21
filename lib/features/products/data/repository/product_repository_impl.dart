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
  final ProductFireStoreDataSource dataSource;
  final ProductStorageDataSource storageDataSource;
  ProductRepositoryImpl({
    required this.dataSource,
    required this.storageDataSource,
  });
  @override
  Future<void> addProduct(ProductEntity entity, String id) async {
    List<ProductTypeModel> typeEntity = [
      for (final type in entity.types)
        ProductTypeModel(name: type.name, price: type.price, id: type.id)
    ];
    List<ProductAddonModel> addOnEntity = [
      for (final addOn in entity.addOns)
        ProductAddonModel(id: addOn.id, name: addOn.name, price: addOn.price)
    ];
    await dataSource.add(ProductModel(
        id: entity.id,
        imagePath: entity.imagePath,
        name: entity.name,
        description: entity.description,
        categoryId: id,
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
  Stream<List<ProductEntity>> getAll(String categoryId) async* {
    final data = dataSource.getAll(categoryId);
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
            categoryId: categoryId,
          )
      ];
    }
  }

  @override
  Future<List<ProductEntity>> search(String categoryId) async {
    final data = await dataSource.search(categoryId);

    final result = [
      for (final results in data)
        ProductEntity(
          name: results.name,
          imagePath: results.imagePath,
          description: results.description,
          categoryId: categoryId,
          id: results.id,
          types: [
            for (final type in results.types)
              ProductTypeEntity(
                name: type.name,
                price: type.price,
                id: type.id,
              )
          ],
          addOns: [
            for (final type in results.addOns)
              ProductAddOnEntity(
                name: type.name,
                price: type.price,
                id: type.id,
              ),
          ],
        )
    ];
    return result;
  }

  Future<void> update(ProductEntity updatedEntity) async {
    List<ProductTypeModel> typeEntity = [
      for (final type in updatedEntity.types)
        ProductTypeModel(name: type.name, price: type.price, id: type.id)
    ];
    List<ProductAddonModel> addOnEntity = [
      for (final addOn in updatedEntity.addOns)
        ProductAddonModel(id: addOn.id, name: addOn.name, price: addOn.price)
    ];
    await dataSource.update(ProductModel(
      id: updatedEntity.id,
      categoryId: updatedEntity.categoryId,
      description: updatedEntity.description,
      imagePath: updatedEntity.imagePath,
      name: updatedEntity.name,
      addOns: [
        for (final f in addOnEntity)
          ProductAddonModel(
            name: f.name,
            price: f.price,
            id: f.id,
          )
      ],
      types: [
        for (final e in typeEntity)
          ProductTypeModel(
            name: e.name,
            price: e.price,
            id: e.id,
          )
      ],
    ));
  }

  @override
  Future<ProductEntity> getById(String id) async {
    final doc = await dataSource.getById(id);
    return ProductEntity(
        name: doc.name,
        imagePath: doc.imagePath,
        description: doc.description,
        categoryId: doc.categoryId,
        id: doc.id,
        types: [
          for (final i in doc.types)
            ProductTypeEntity(
              name: i.name,
              price: i.price,
              id: i.id,
            )
        ],
        addOns: [
          for (final j in doc.addOns)
            ProductAddOnEntity(
              name: j.name,
              id: j.id,
              price: j.price,
            )
        ]);
  }

  @override
  Future<void> deleteStorage(String fileName) async {
    await storageDataSource.delete(fileName);
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
    storageDataSource: ref.watch(productStorageDataSourceProvider),
    dataSource: ref.watch(productFireStoreDataSourceProvider),
  );
}
