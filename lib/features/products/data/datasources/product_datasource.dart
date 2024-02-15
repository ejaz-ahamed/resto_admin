import 'package:resto_admin/features/products/data/models/product_model.dart';

abstract class ProductDatasource {
  Future<void> addProductFireStore(ProductModel model);
  Future<void> deleteProductFromFireStore(String id);
}
