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
  final txtType = 'Types';
  final txtFullQty = 'Full';
  final txtFullQtyPrice = '\$25';
  final txtHalfQty = 'Half';
  final txtHalfQtyPrice = '\$15';
  final elevatedBtnTxt = 'Add Type';
  final txtAddOns = 'Add-Ons';
  final txtAddCategoryTitle = 'Add New Category';
  final txtAddOnBtnTitle = 'Add Add-Ons';
  final txtSaveBtn = 'Save';
  final txtEditCategoryTitle = 'Edit category';
  final txtDelete = 'Delete';
  final txtCategoryName = 'Category Name';
  final txtSoups = 'Soups';
  final txtDescriptionTitle = "Description";
  final txtDescriptionfull =
      "Lorem ipsum dolor sit amet consectetur. Imperdiet mi tellus quam lacinia porttitor sed at proin molestie. Ipsum sit leo nisi felis. Volutpat ut tempus suspendisse lacinia tincidunt euismod at elit volutpat. Tristique felis scelerisque sed hendrerit ante. Diam donec nunc massa dolor sed neque commodo nec.";
}

@riverpod
ProductConstants productConstants(ProductConstantsRef ref) {
  return ProductConstants();
}
