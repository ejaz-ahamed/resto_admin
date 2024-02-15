import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_admin/features/products/data/datasources/product_datasource.dart';
import 'package:resto_admin/features/products/data/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_datasource_impl.g.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final collection = FirebaseFirestore.instance
      .collection('products')
      .withConverter(
          fromFirestore: ProductModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addProductFireStore(ProductModel model) async {
    collection.doc(model.name).set(model);
  }

  @override
  Future<void> deleteProductFromFireStore(String id) async {
    collection.doc(id).delete();
  }
}

@riverpod
ProductDatasource productDatasource(ProductDatasourceRef ref) {
  return ProductDatasourceImpl();
}
