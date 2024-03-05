import 'dart:io';

import 'package:resto_admin/core/exceptions/base_exception/base_exception.dart';
import 'package:resto_admin/core/utils/snack_bar_utils.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/domain/repository/product_repository.dart';

final class AddProductUsecase {
  final ProductRepository repository;
  AddProductUsecase({required this.repository});
  Future<void> call({
    required String name,
    required String description,
    required String imagePath,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String categoryId,
    required String availableFrom,
    required String availableto,
  }) async {
    try {
      if (types.isEmpty) {
        Future.sync(
          () => SnackBarUtils.showMessage(
              "Atleast one type is required,try again."),
        );
      } else {
        final uploadedPath = await repository.upload(File(imagePath), name);
        await repository.addProduct(
            ProductEntity(
              availableFrom: availableFrom,
              availableUpTo: availableto,
              types: types,
              addOns: addOns,
              id: id,
              categoryId: categoryId,
              name: name,
              imagePath: uploadedPath,
              description: description,
            ),
            categoryId);
      }
    } catch (e) {
      throw BaseException('Cannot add product Details');
    }
  }
}
