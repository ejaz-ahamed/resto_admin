import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class GetProductByIdUseCase {
  final ProductRepository repository;
  GetProductByIdUseCase({required this.repository});

  Future<ProductEntity> call(String productId) async {
    try {
      final product = await repository.getById(productId);
      return product.copyWith(
        imagePath: await FirebaseStorageUtils.getDownloadUrl(product.imagePath),
      );
    } catch (e) {
      throw BaseException('Cannot get product');
    }
  }
}
