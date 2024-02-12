import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_page_constants.g.dart';

class ProfilePageContstants {
  final txtEditprofile = 'Edit profile';
  final txtEditPassword = 'Edit Password';
  final txtAddImage = 'Add image';
  final txtOpeningTime = 'Opening time';
  final txtClosingTime = 'Closing time';
  final txtHintenterHere = 'Enter here...';
  final icAddImage = 'assets/icons/ic_add_image.svg';
  final icArrowBackward = 'assets/icons/ic_arrow_backward.svg';
  final txtSave = 'Save';
  final txtCurrentPassword = 'Current password';
  final txtNewPassword = 'New password';
  final txtConfirmPassword = 'Confirm password';
  final txtCamera = 'Camera';
  final txtGallery = 'Gallery';
}

@riverpod
ProfilePageContstants profilePageContstants(ProfilePageContstantsRef ref) {
  return ProfilePageContstants();
}
