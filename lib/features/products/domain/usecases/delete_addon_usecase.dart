import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class DeleteAddOnUseCase {
  final ProductRepository repository;
  DeleteAddOnUseCase({required this.repository});
  Future<void> call(String productId, String addOnId) async {
    try {
      await repository.deleteAddon(productId, addOnId);
    } catch (e) {
      throw BaseException('Cannot Delete addOns');
    }
  }
}
