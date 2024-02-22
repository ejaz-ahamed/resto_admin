import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_offer_page_constants.g.dart';

class EditOfferPageConstants {
  final txtAppbarTitle = 'Edit Offer';
  final txtTitle = 'Title';
  final txtHintTextTitle = 'Enter Title...';
  final txtDescription = 'Offer Description';
  final txtHintTextdescription = 'Enter Description...';
  final txtOfferDetails = 'Offer Details';
  final txtAmountText = 'Amount';
  final txtPercentageText = 'Percentage';
  final txtHintTextPercentage = 'Enter Offer Percentage';
  final txtHintTextAmount = 'Enter Offer Amount';
  final txtProduct = 'Product';
  final txtAdd = 'Add';
  final txtSave = 'Save';
  final txtAddImage = 'Add Image';
  final txtDelete = 'Delete';
}

@riverpod
EditOfferPageConstants editOfferPageConstants(EditOfferPageConstantsRef ref) {
  return EditOfferPageConstants();
}
