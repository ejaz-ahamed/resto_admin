import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class DeleteProductUsecase {
  final ProductRepository repository;
  DeleteProductUsecase({required this.repository});
  Future<void> call(String id) async {
    try {
      final data = await repository.getById(id);
      await repository.deleteStorage(data.name);
      return await repository.deleteProduct(id);
    } catch (e) {
      throw BaseException('Cannot Delete product');
    }
  }
}
