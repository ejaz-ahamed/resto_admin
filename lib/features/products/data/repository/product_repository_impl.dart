import 'package:resto_admin/features/products/data/datasources/product_datasource.dart';
import 'package:resto_admin/features/products/data/datasources/product_datasource_impl.dart';
import 'package:resto_admin/features/products/data/models/product_model.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;
  ProductRepositoryImpl({required this.datasource});
  @override
  Future<void> addProductToFirestore(ProductEntity entity) async {
    final model = ProductModel(
      image_path: entity.image_path,
      name: entity.name,
      description: entity.description,
      // types: entity.types!,
      // addOns: entity.addOns!,
    );
    await datasource.addProductFireStore(model);
  }

  @override
  Future<void> deleteProductFromFirestore(String id) async {
    datasource.deleteProductFromFireStore(id);
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
      datasource: ref.watch(productDatasourceProvider));
}
