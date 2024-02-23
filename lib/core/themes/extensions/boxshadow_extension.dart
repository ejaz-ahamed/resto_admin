import 'package:flutter/material.dart';

class AppBoxShadowExtension extends ThemeExtension<AppBoxShadowExtension> {
  final BoxShadow primary;
  final BoxShadow secondary;

  AppBoxShadowExtension({required this.primary, required this.secondary});

  @override
  ThemeExtension<AppBoxShadowExtension> copyWith(
      {BoxShadow? primary, BoxShadow? secondary}) {
    return AppBoxShadowExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary);
  }

  @override
  ThemeExtension<AppBoxShadowExtension> lerp(
      covariant ThemeExtension<AppBoxShadowExtension>? other, double t) {
    if (other is! AppBoxShadowExtension) {
      return this;
    }

    return AppBoxShadowExtension(
        primary: BoxShadow.lerp(primary, other.primary, t)!,
        secondary: BoxShadow.lerp(secondary, other.secondary, t)!);
  }
}
