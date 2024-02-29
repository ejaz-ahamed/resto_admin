import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_offer_page_constants.g.dart';

class AddOfferPageConstants {
  final txtAppbarTitle = 'Add Offers';
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
  final txtAdd = 'Add new offers';
  final txtSave = 'Save';
  final txtAddImage = 'Add Image';
}

@riverpod
AddOfferPageConstants addOfferPageConstants(AddOfferPageConstantsRef ref) {
  return AddOfferPageConstants();
}
