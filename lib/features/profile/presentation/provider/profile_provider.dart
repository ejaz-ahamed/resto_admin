import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/theme_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  bool build() {
    //// Indicate the theme of the app
    return ref.read(themeProvider).brightness == Brightness.dark;
  }

  /// Change the theme
  void toggleTheme() {
    state = !state;
  }
}
