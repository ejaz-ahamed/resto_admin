import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/products/data/datasources/product_firestore_datasource.dart';
import 'package:resto_admin/features/products/data/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_firestore_datasource_impl.g.dart';

class ProductFirestoreDataSourceImpl implements ProductFireStoreDataSource {
  final collection = FirebaseFirestore.instance
      .collection('products')
      .withConverter(
          fromFirestore: ProductModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> add(ProductModel model) async {
    await collection.doc(model.name).set(model);
  }

  @override
  Future<void> remove(String id) async {
    return await collection.doc(id).delete();
  }

  @override
  Stream<List<ProductModel>> getAll() async* {
    final productSteame = collection.snapshots();
    await for (final products in productSteame) {
      yield [
        for (final product in products.docs) product.data(),
      ];
    }
  }

  @override
  Future<ProductModel> getById(String id) async {
    final data = await collection.doc(id).get();
    return data.data()!;
  }
}

@riverpod
ProductFireStoreDataSource productFireStoreDataSource(
    ProductFireStoreDataSourceRef ref) {
  return ProductFirestoreDataSourceImpl();
}
