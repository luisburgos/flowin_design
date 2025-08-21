import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FlowinDesignThemes {
  /// @no-doc
  static ThemeData light = _themeData(
    FlowinDesignSchemes.light,
    Brightness.light,
  );

  /// @no-doc
  static ThemeData dark = _themeData(
    FlowinDesignSchemes.dark,
    Brightness.dark,
  );

  static ThemeData _themeData(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    var baseTheme = ThemeData(brightness: brightness);
    baseTheme = baseTheme.copyWith(
      textTheme: FlowinTypefaces.baseline(),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: baseTheme.textTheme,
    );
  }
}
