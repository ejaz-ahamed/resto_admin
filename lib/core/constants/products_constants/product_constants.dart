import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_constants.g.dart';

class ProductConstants {
  final txtAddPrdtsTitle = 'Add New Products';
  final txtProductTitle = 'Products';
  final txtManageCategories = ' Manage Categories';
  final txtAddCategory = 'Add Category';
  final txtDelete = 'Delete';
  final txtSelectAll = 'Select All';
}

@riverpod
ProductConstants productConstants(ProductConstantsRef ref) {
  return ProductConstants();
}
