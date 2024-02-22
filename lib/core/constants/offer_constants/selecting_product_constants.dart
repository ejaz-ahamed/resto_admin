import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selecting_product_constants.g.dart';

class SelectingProductPageConstants {
  final txtTitleCategories = 'Categories';
  final txtAppbarTitle = 'Selected Product';
  final txtAddOfferText = 'Add';
  final txtSelectAllText = 'Select All';
  final txtListtext = 'Hot Soup';
  final txtSave = 'Save';
  final txtUnSelect = 'Unselect';
}

@riverpod
SelectingProductPageConstants selectingProductPageConstants(
    SelectingProductPageConstantsRef ref) {
  return SelectingProductPageConstants();
}
