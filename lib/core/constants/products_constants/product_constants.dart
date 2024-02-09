import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_constants.g.dart';

class ProductConstants {
  final txtaddPdtTitle = 'Add New Products';
  final txtproductTitle = 'Products';
}

@riverpod
ProductConstants productConstants(ProductConstantsRef ref) {
  return ProductConstants();
}
