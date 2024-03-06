import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

class SearchProductUsecase {
  final ProductRepository repository;
  SearchProductUsecase({required this.repository});

  Future<List<ProductEntity>?> call(String keyword, String categoryId) async {
    try {
      if (keyword.trim().isEmpty) {
        return null;
      }

      final allProducts = await repository.search(categoryId);
      final List<ProductEntity> searchResult = [];

      for (final product in allProducts) {
        final productEntity = ProductEntity(
          availableFrom: product.availableFrom,
          availableUpTo: product.availableUpTo,
          name: product.name,
          imagePath:
              await FirebaseStorageUtils.getDownloadUrl(product.imagePath),
          description: product.description,
          id: product.id,
          categoryId: categoryId,
          types: [
            for (final type in product.types)
              ProductTypeEntity(
                name: type.name,
                price: type.price,
                id: type.id,
              )
          ],
          addOns: [
            for (final add in product.types)
              ProductAddOnEntity(
                name: add.name,
                price: add.price,
                id: add.id,
              )
          ],
        );

        keyword = keyword.toLowerCase().trim();
        if (product.name.toLowerCase().trim().contains(keyword) ||
            product.description.toLowerCase().trim().contains(keyword)) {
          searchResult.add(productEntity);
        }
      }
      return searchResult;
    } catch (e) {
      throw BaseException('Cannot complete search');
    }
  }
}
