import 'package:flutter/material.dart';

class SitechTheme extends ThemeExtension<SitechTheme> {
  const SitechTheme();

  @override
  ThemeExtension<SitechTheme> copyWith({Color? tripHeaderColor}) {
    return const SitechTheme();
  }

  @override
  ThemeExtension<SitechTheme> lerp(
    covariant ThemeExtension<SitechTheme>? other,
    double t,
  ) {
    if (other is! SitechTheme) return this;
    return const SitechTheme();
  }
}
