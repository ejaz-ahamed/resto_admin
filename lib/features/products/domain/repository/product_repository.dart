import 'package:resto_admin/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> addProductToFirestore(ProductEntity entity);
  Future<void> deleteProductFromFirestore(String id);
}
