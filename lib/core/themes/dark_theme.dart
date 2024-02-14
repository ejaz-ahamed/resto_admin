import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/color_palette.dart';
import 'package:resto_admin/core/themes/extensions/boxshadow_extension.dart';
import 'package:resto_admin/core/themes/extensions/color_extension.dart';
import 'package:resto_admin/core/themes/extensions/space_extension.dart';
import 'package:resto_admin/core/themes/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_theme.g.dart';

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.red400,
      secondary: AppColorPalettes.grey1000,
      text: AppColorPalettes.blue900,
      textInverse: AppColorPalettes.gray200,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.grey400,
      textDisabled: AppColorPalettes.grey350,
      backgroundDanger: Colors.red,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.white500,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
    AppBoxShadowExtension(
      primary: BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        color: Colors.grey.withOpacity(1),
      ),
      secondary: BoxShadow(
        blurRadius: 20,
        spreadRadius: -10,
        color: Colors.black.withOpacity(0),
      ),
    )
  ],
);

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return _darkTheme;
}
