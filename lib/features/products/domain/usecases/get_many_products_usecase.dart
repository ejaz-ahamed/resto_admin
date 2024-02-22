import 'package:resto_admin/core/exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class GetManyProductsUseCase {
  final ProductRepository repository;
  GetManyProductsUseCase({required this.repository});

  Future<List<ProductEntity>> call(Set<String> productIds) async {
    try {
      final getProductsFutures = <Future<ProductEntity>>[];

      for (final productId in productIds) {
        getProductsFutures.add(repository.getById(productId));
      }

      final products = (await Future.wait(getProductsFutures));
      final productsWithImageUrl = <ProductEntity>[];

      /// Get the download URL of the product images
      for (final product in products) {
        productsWithImageUrl.add(
          ProductEntity(
            name: product.name,
            imagePath:
                await FirebaseStorageUtils.getDownloadUrl(product.imagePath),
            description: product.description,
            id: product.id,
            categoryId: product.categoryId,
            types: [
              for (final type in product.types)
                ProductTypeEntity(
                  name: type.name,
                  price: type.price,
                  id: type.id,
                )
            ],
            addOns: [
              for (final add in product.addOns)
                ProductAddOnEntity(
                  name: add.name,
                  price: add.price,
                  id: add.id,
                )
            ],
          ),
        );
      }

      return products;
    } catch (e) {
      throw BaseException('Cannot get product details');
    }
  }
}
