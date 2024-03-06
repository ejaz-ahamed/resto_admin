import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class DeleteTypeUseCase {
  final ProductRepository repository;
  DeleteTypeUseCase({required this.repository});
  Future<void> call(String productId, String typeId) async {
    try {
      await repository.deleteType(productId, typeId);
    } catch (e) {
      throw BaseException('Cannot Delete types');
    }
  }
}
