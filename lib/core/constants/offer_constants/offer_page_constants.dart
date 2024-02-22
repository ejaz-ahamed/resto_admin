import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_page_constants.g.dart';

class OfferPageConstants {
  final txtOfferText = 'Offer up to 30%';
  final txtAppbarTitle = 'Offers';
  final txtAddOfferText = 'Add';
  final txtAddOnText = 'Add Add-on';
}

@riverpod
OfferPageConstants offerPageConstants(OfferPageConstantsRef ref) {
  return OfferPageConstants();
}
