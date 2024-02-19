import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/firebase_storage_utils.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/category_repository.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class GetAllProductsUseCase {
  final ProductRepository repository;
  GetAllProductsUseCase({required this.repository});

  Stream<List<ProductEntity>> call() async* {
    try {
      final productStream = repository.getAll();

      await for (final products in productStream) {
        yield [
          for (final product in products)
            ProductEntity(
              name: product.name,
              imagePath:
                  await FirebaseStorageUtils.getDownloadUrl(product.imagePath),
              description: product.description,
              id: product.id,
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
            )
        ];
      }
    } catch (e) {
      throw BaseException('Data not found');
    }
  }
}
