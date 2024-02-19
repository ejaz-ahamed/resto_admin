import 'package:resto_admin/features/products/data/models/product_model.dart';

abstract class ProductFireStoreDataSource {
  Future<void> add(ProductModel model);
  Future<void> remove(String id);
  Stream<List<ProductModel>> getAll();
}
