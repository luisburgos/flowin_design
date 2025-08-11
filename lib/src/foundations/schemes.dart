import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FlowinDesignSchemes {
  /// @no-doc
  const FlowinDesignSchemes();

  /// @no-doc
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: FlowinDesignColors.primary800,
    onPrimary: FlowinDesignColors.white,
    secondary: FlowinDesignColors.secondary200,
    onSecondary: FlowinDesignColors.secondary800,
    tertiary: FlowinDesignColors.tertiary100,
    onTertiary: FlowinDesignColors.tertiary800,
    surface: FlowinDesignColors.white,
    onSurface: FlowinDesignColors.neutral800,
    onSurfaceVariant: FlowinDesignColors.neutral500,
    inverseSurface: FlowinDesignColors.neutral700,
    onInverseSurface: FlowinDesignColors.white,
    shadow: FlowinDesignColors.neutral200,
    primaryContainer: FlowinDesignColors.primary800,
    onPrimaryContainer: FlowinDesignColors.white,
    secondaryContainer: FlowinDesignColors.secondary200,
    onSecondaryContainer: FlowinDesignColors.secondary800,
    outline: FlowinDesignColors.neutral800,
    outlineVariant: FlowinDesignColors.neutral200,
    error: FlowinDesignColors.error500,
    onError: FlowinDesignColors.white,
    errorContainer: FlowinDesignColors.error100,
    onErrorContainer: FlowinDesignColors.error500,
  );

  /// @no-doc
  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: FlowinDesignColors.primary200,
    onPrimary: FlowinDesignColors.primary800,
    secondary: FlowinDesignColors.secondary700,
    onSecondary: FlowinDesignColors.secondary200,
    tertiary: FlowinDesignColors.tertiary500,
    onTertiary: FlowinDesignColors.tertiary800,
    surface: FlowinDesignColors.neutral800,
    onSurface: FlowinDesignColors.neutral200,
    onSurfaceVariant: FlowinDesignColors.neutral400,
    surfaceBright: FlowinDesignColors.neutral700,
    // TODO(luis): ask about onSurfaceBright neutral200
    // TODO(luis): ask about onSurfaceBrightVariant neutral400
    inverseSurface: FlowinDesignColors.white,
    onInverseSurface: FlowinDesignColors.neutral800,
    shadow: FlowinDesignColors.neutral700,
    primaryContainer: FlowinDesignColors.primary200,
    onPrimaryContainer: FlowinDesignColors.primary800,
    secondaryContainer: FlowinDesignColors.secondary700,
    onSecondaryContainer: FlowinDesignColors.secondary200,
    outline: FlowinDesignColors.neutral200,
    outlineVariant: FlowinDesignColors.neutral700,
    error: FlowinDesignColors.error500,
    onError: FlowinDesignColors.white,
    errorContainer: FlowinDesignColors.error800,
    onErrorContainer: FlowinDesignColors.error500,
  );
}

/// @no-doc
extension ColorSchemeExt on ColorScheme {
  /// @no-doc
  Color get fixedNeutral200 => FlowinDesignColors.neutral200;

  /// @no-doc
  Color get fixedNeutral600 => FlowinDesignColors.neutral600;

  /// @no-doc
  Color get fixedSuccess => FlowinDesignColors.success500;
}
