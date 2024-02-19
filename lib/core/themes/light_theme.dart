import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/color_palette.dart';
import 'package:resto_admin/core/themes/extensions/boxshadow_extension.dart';
import 'package:resto_admin/core/themes/extensions/color_extension.dart';
import 'package:resto_admin/core/themes/extensions/space_extension.dart';
import 'package:resto_admin/core/themes/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.red400,
      secondary: AppColorPalettes.white500,
      text: AppColorPalettes.blue900,
      textInverse: AppColorPalettes.gray200,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.grey400,
      textDisabled: AppColorPalettes.grey350,
      bottomNavBorder: AppColorPalettes.grey350.withOpacity(0.2),
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.blue900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
    AppBoxShadowExtension(
      primary: BoxShadow(
        blurRadius: 34,
        spreadRadius: -10,
        color: Colors.black.withOpacity(0.1),
      ),
        secondary: BoxShadow(
          blurRadius: 20,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.2),
        ))
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
