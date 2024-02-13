import 'package:flutter/material.dart';

class AppBoxShadowExtension extends ThemeExtension<AppBoxShadowExtension> {
  final BoxShadow primary;

  AppBoxShadowExtension({required this.primary});

  @override
  ThemeExtension<AppBoxShadowExtension> copyWith({BoxShadow? primary}) {
    return AppBoxShadowExtension(primary: primary ?? this.primary);
  }

  @override
  ThemeExtension<AppBoxShadowExtension> lerp(
      covariant ThemeExtension<AppBoxShadowExtension>? other, double t) {
    if (other is! AppBoxShadowExtension) {
      return this;
    }

    return AppBoxShadowExtension(
        primary: BoxShadow.lerp(primary, other.primary, t)!);
  }
}
