import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  bool build() {
    //// Indicate the theme of the app
    return false;
  }

  /// Change the theme
  void toggleTheme() {
    state = !state;
  }
}
