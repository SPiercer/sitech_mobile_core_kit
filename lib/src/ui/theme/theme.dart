import 'package:flutter/material.dart';
import 'package:sitech_mobile_core_kit/src/ui/theme/color_scheme.g.dart';
import 'extensions.dart' as ext;

abstract class SitechTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'Oxygen',
        package: 'sitech_mobile_core_kit',
        extensions: const {ext.SitechTheme()},
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: 'Oxygen',
        package: 'sitech_mobile_core_kit',
        extensions: const {ext.SitechTheme()},
      );
}
