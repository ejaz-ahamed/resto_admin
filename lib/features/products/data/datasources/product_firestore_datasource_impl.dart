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
  Stream<List<ProductModel>> getAll(String categoryId) async* {
    final productSteame =
        collection.where('categoryId', isEqualTo: categoryId).snapshots();
    await for (final products in productSteame) {
      yield [
        for (final product in products.docs) product.data(),
      ];
    }
  }

  @override
  Future<List<ProductModel>> search(String categoryId) async {
    final searchedProducts =
        await collection.where('categoryId', isEqualTo: categoryId).get();
    return [
      for (final product in searchedProducts.docs) product.data(),
    ];
  }

  @override
  Future<ProductModel> getById(String id) async {
    final data = await collection.doc(id).get();
    return data.data()!;
  }

  @override
  Future<void> update(ProductModel updatedModel) async {
    await collection.doc(updatedModel.id).set(updatedModel);
  }

  @override
  Future<void> deleteAddon(String productId, String addonId) async {
    final data = await collection.doc(productId).get();
    final update = <String, dynamic>{
      'addOns': [
        for (final addon in data.data()!.addOns)
          if (addon.id != addonId) addon.toFirestore()
      ],
    };
    await collection.doc(productId).update(update);
  }

  @override
  Future<void> deleteType(String productId, String typeId) async {
    final data = await collection.doc(productId).get();
    final update = <String, dynamic>{
      'types': [
        for (final type in data.data()!.types)
          if (type.id != typeId) type.toFirestore()
      ],
    };
    await collection.doc(productId).update(update);
  }
}

@riverpod
ProductFireStoreDataSource productFireStoreDataSource(
    ProductFireStoreDataSourceRef ref) {
  return ProductFirestoreDataSourceImpl();
}
