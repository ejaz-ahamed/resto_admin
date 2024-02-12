import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_constants.g.dart';

class ProductConstants {
  final txtAddPrdtsTitle = 'Add New Products';
  final txtProductTitle = 'Products';
  final txtManageCategories = ' Manage Categories';
  final txtAddCategory = 'Add Category';
}

@riverpod
ProductConstants productConstants(ProductConstantsRef ref) {
  return ProductConstants();
}
