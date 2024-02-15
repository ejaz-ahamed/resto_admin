import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class AddProductUsecase {
  final ProductRepository repository;
  AddProductUsecase({required this.repository});
  Future<void> call(ProductEntity entity) async {
    try {
      return await repository.addProductToFirestore(entity);
    } catch (e) {
      throw BaseException('Cannot add product');
    }
  }
}
