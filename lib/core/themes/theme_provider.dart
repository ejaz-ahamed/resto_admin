import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/dark_theme.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() {
    return ref.watch(lightThemeProvider);
  }

  void switchTheme() {
    if (state.brightness == Brightness.light) {
      state = ThemeData.dark();
    } else {
      state = ThemeData.light();
    }
  }
}
