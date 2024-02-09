import 'dart:ui';

import 'package:flutter/material.dart';

final class AppSpaceExtension extends ThemeExtension<AppSpaceExtension> {
  final double space_25;
  final double space_50;
  final double space_75;
  final double space_100;
  final double space_125;
  final double space_150;
  final double space_200;
  final double space_250;
  final double space_300;
  final double space_400;
  final double space_500;
  final double space_600;
  final double space_700;
  final double space_800;
  final double space_900;

  AppSpaceExtension.fromBaseSpace(double baseSpace)
      : space_25 = baseSpace * 0.25,
        space_50 = baseSpace * 0.5,
        space_75 = baseSpace * 0.75,
        space_100 = baseSpace,
        space_125 = baseSpace * 1.25,
        space_150 = baseSpace * 1.5,
        space_200 = baseSpace * 2,
        space_250 = baseSpace * 2.5,
        space_300 = baseSpace * 3,
        space_400 = baseSpace * 4,
        space_500 = baseSpace * 5,
        space_600 = baseSpace * 6,
        space_700 = baseSpace * 7,
        space_800 = baseSpace * 8,
        space_900 = baseSpace * 9;

  AppSpaceExtension({
    required this.space_25,
    required this.space_50,
    required this.space_75,
    required this.space_100,
    required this.space_125,
    required this.space_150,
    required this.space_200,
    required this.space_250,
    required this.space_300,
    required this.space_400,
    required this.space_500,
    required this.space_600,
    required this.space_700,
    required this.space_800,
    required this.space_900,
  });

  @override
  ThemeExtension<AppSpaceExtension> copyWith({
    double? space_25,
    double? space_50,
    double? space_75,
    double? space_100,
    double? space_125,
    double? space_150,
    double? space_200,
    double? space_250,
    double? space_300,
    double? space_400,
    double? space_500,
    double? space_600,
    double? space_700,
    double? space_800,
    double? space_900,
  }) {
    return AppSpaceExtension(
      space_25: space_25 ?? this.space_25,
      space_50: space_50 ?? this.space_50,
      space_75: space_75 ?? this.space_75,
      space_100: space_100 ?? this.space_100,
      space_125: space_125 ?? this.space_125,
      space_150: space_150 ?? this.space_150,
      space_200: space_200 ?? this.space_200,
      space_250: space_250 ?? this.space_250,
      space_300: space_300 ?? this.space_300,
      space_400: space_400 ?? this.space_400,
      space_500: space_500 ?? this.space_500,
      space_600: space_600 ?? this.space_600,
      space_700: space_700 ?? this.space_700,
      space_800: space_800 ?? this.space_800,
      space_900: space_900 ?? this.space_900,
    );
  }

  @override
  ThemeExtension<AppSpaceExtension> lerp(
      covariant ThemeExtension<AppSpaceExtension>? other, double t) {
    if (other is! AppSpaceExtension) {
      return this;
    }

    return AppSpaceExtension(
      space_25: lerpDouble(space_25, other.space_25, t)!,
      space_50: lerpDouble(space_50, other.space_50, t)!,
      space_75: lerpDouble(space_75, other.space_75, t)!,
      space_100: lerpDouble(space_100, other.space_100, t)!,
      space_125: lerpDouble(space_125, other.space_125, t)!,
      space_150: lerpDouble(space_150, other.space_150, t)!,
      space_200: lerpDouble(space_200, other.space_200, t)!,
      space_250: lerpDouble(space_250, other.space_250, t)!,
      space_300: lerpDouble(space_300, other.space_300, t)!,
      space_400: lerpDouble(space_400, other.space_400, t)!,
      space_500: lerpDouble(space_500, other.space_500, t)!,
      space_600: lerpDouble(space_600, other.space_600, t)!,
      space_700: lerpDouble(space_700, other.space_700, t)!,
      space_800: lerpDouble(space_800, other.space_800, t)!,
      space_900: lerpDouble(space_900, other.space_900, t)!,
    );
  }
}
