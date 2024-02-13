import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_constants.g.dart';

class ProductConstants {
  final txtAddPrdtsTitle = 'Add New Products';
  final txtProductTitle = 'Products';
  final txtAddImg = 'Add Image';
  final txtProductName = 'Product Name';
  final txtHintProduct = 'Enter item Name...';
  final txtDescription = 'Description';
  final txtHintDescription = 'Enter Description...';
  final txtCategory = 'Category';
  final txtItems = 'Items';
  final txtAddBtn = 'Add';
  final txtEditbtn = 'Edit';
  final txtFieldHint = 'Search';
  final txtEditCategoryTitle = 'Edit Category';
}

@riverpod
ProductConstants productConstants(ProductConstantsRef ref) {
  return ProductConstants();
}
