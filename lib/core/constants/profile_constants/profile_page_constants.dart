import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_page_constants.g.dart';

class ProfilePageConstants {
  /// The user ID of the admin user
  final txtAdminUserId = 'admin';

  final txtEditprofile = 'Edit profile';
  final txtEditPassword = 'Edit Password';
  final txtAddImage = 'Add image';
  final txtOpeningTime = 'Opening time';
  final txtClosingTime = 'Closing time';
  final txtHintenterHere = 'Enter here...';
  final txtSave = 'Save';
  final txtCurrentPassword = 'Current password';
  final txtNewPassword = 'New password';
  final txtConfirmPassword = 'Confirm password';
  final txtCamera = 'Camera';
  final txtGallery = 'Gallery';
  final txtSelectTime = 'Select time';
  final txtNoTimeSelected = 'No time selected';
  final txtTitle = 'Profile';
  final txtDarktheme = 'Dark theme';
  final txtUpdatePassword = 'Update Password';
  final txtEdit = 'Edit';
  final icArrowBackward = 'assets/icons/ic_arrow_backward.svg';
  final txtLogOut = 'Log out';
  final txtCancel = 'Cancel';
  final txtLoading = 'Loading...';
  final txtDelete = 'Delete';
  final errorPassword = "Password doesn't match";
  final errorEmptyPassword = "Input is Empty";
}

@riverpod
ProfilePageConstants profilePageConstants(ProfilePageConstantsRef ref) {
  return ProfilePageConstants();
}
