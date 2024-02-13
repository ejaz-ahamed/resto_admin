import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_assets_constants.g.dart';

final class AppAssetsConstants {
  /// Prefix used for the app icons
  static const _iconsPath = 'assets/icons/ic_';
  final icHome = '${_iconsPath}home_icon.svg';
  final icBowl = '${_iconsPath}bowl_icon.svg';
  final icBag = '${_iconsPath}bag_icon.svg';
  final icOffers = '${_iconsPath}offers_icon.svg';
  final icArrowBackward = '${_iconsPath}arrow_backward_icon.svg';
  final icAdd = '${_iconsPath}add_icon.svg';
  final icAddImage = '${_iconsPath}add_image_icon.svg';
  final icRemove = '${_iconsPath}remove_icon.svg';
  final icSearch = '${_iconsPath}search_icon.svg';
  final icUser = '${_iconsPath}user_icon.svg';
}

@riverpod
AppAssetsConstants appAssetsConstants(AppAssetsConstantsRef ref) {
  return AppAssetsConstants();
}
