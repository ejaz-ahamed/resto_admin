import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offers_constants.g.dart';

class OffersConstants {
  final txtPageTitle = 'Add Offers';
  final txtfeildtitle = "Title";
  final txtfeildhindtext = "Enter title";
  final txtfeildsubtitle = "Offer Description";
  final txtfeildhindtext2 = "Enter description";
}

@riverpod
OffersConstants offersConstants(OffersConstantsRef ref) {
  return OffersConstants();
}
