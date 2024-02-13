import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_page_constants.g.dart';

class ProfilepageConstants {
  final txtTitle = 'Profile';

  final txtOpeningTime = 'Opening time';
  final txtClosingtime = 'Closing time';
  final txtDarktheme = 'Dark theme';
  final txtUpdatePassword = 'Update Password';
  final txtEdit = 'Edit';
  final icArrowBackward = 'assets/icons/ic_arrow_backward.svg';
}

@riverpod
ProfilepageConstants profilePage(ProfilePageRef ref) {
  return ProfilepageConstants();
}
