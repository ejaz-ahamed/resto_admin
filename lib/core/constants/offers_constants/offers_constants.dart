import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offers_constants.g.dart';

class OffersConstants {
  //page 1
  final txtPageTitle = 'Add Offers';
  final txtfeildtitle = "Title";
  final txtfeildhindtext = "Enter title";
  final txtfeildsubtitle = "Offer Description";
  final txtfeildhindtext2 = "Enter description";

  //page 2
  final txtPageTitle2 = "Selected Product";
  final txtfeildtitle2 = "Title";
  final txtfeildsubtitle2 = "Offer Description";
}

@riverpod
OffersConstants offersConstants(OffersConstantsRef ref) {
  return OffersConstants();
}
