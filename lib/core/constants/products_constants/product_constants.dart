import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_constants.g.dart';

class ProductConstants{
  final txtAddPrdtsTitle = 'Add New Products';
}

@riverpod
ProductConstants productConstants(ProductConstantsRef ref){
  return ProductConstants();
}