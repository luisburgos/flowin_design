import 'package:flutter/material.dart';

/// Holds mappings for light and dark mode color schemes.
class ColorSchemeMapper {
  /// @no-doc
  ColorSchemeMapper({
    required this.light,
    required this.dark,
    this.schemeVariant = DynamicSchemeVariant.fidelity,
  });

  /// @no-doc
  final DynamicSchemeVariant schemeVariant;

  /// @no-doc
  final ColorScheme light;

  /// @no-doc
  final ColorScheme dark;

  /// Returns a flattened map of color roles to their values
  Map<String, Color> asMap(Brightness brightness) {
    final scheme = brightness == Brightness.dark ? dark : light;

    return {
      'primary': scheme.primary,
      'onPrimary': scheme.onPrimary,
      'primaryContainer': scheme.primaryContainer,
      'onPrimaryContainer': scheme.onPrimaryContainer,
      //'primaryFixed': scheme.primaryFixed,
      //'primaryFixedDim': scheme.primaryFixedDim,
      //'onPrimaryFixed': scheme.onPrimaryFixed,
      //'onPrimaryFixedVariant': scheme.onPrimaryFixedVariant,
      'secondary': scheme.secondary,
      'onSecondary': scheme.onSecondary,
      'secondaryContainer': scheme.secondaryContainer,
      'onSecondaryContainer': scheme.onSecondaryContainer,
      //'secondaryFixed': scheme.secondaryFixed,
      //'secondaryFixedDim': scheme.secondaryFixedDim,
      //'onSecondaryFixed': scheme.onSecondaryFixed,
      //'onSecondaryFixedVariant': scheme.onSecondaryFixedVariant,
      //'tertiary': scheme.tertiary,
      //'onTertiary': scheme.onTertiary,
      //'tertiaryContainer': scheme.tertiaryContainer,
      //'onTertiaryContainer': scheme.onTertiaryContainer,
      //'tertiaryFixed': scheme.tertiaryFixed,
      //'tertiaryFixedDim': scheme.tertiaryFixedDim,
      //'onTertiaryFixed': scheme.onTertiaryFixed,
      //'onTertiaryFixedVariant': scheme.onTertiaryFixedVariant,
      'error': scheme.error,
      'onError': scheme.onError,
      'errorContainer': scheme.errorContainer,
      'onErrorContainer': scheme.onErrorContainer,
      'surface': scheme.surface,
      'onSurface': scheme.onSurface,
      //'surfaceDim': scheme.surfaceDim,
      //'surfaceBright': scheme.surfaceBright,
      //'surfaceContainerLowest': scheme.surfaceContainerLowest,
      //'surfaceContainerLow': scheme.surfaceContainerLow,
      //'surfaceContainer': scheme.surfaceContainer,
      //'surfaceContainerHigh': scheme.surfaceContainerHigh,
      //'surfaceContainerHighest': scheme.surfaceContainerHighest,
      'onSurfaceVariant': scheme.onSurfaceVariant,
      'outline': scheme.outline,
      'outlineVariant': scheme.outlineVariant,
      //'shadow': scheme.shadow,
      //'scrim': scheme.scrim,
      'inverseSurface': scheme.inverseSurface,
      'onInverseSurface': scheme.onInverseSurface,
      //'inversePrimary': scheme.inversePrimary,
      //'surfaceTint': scheme.surfaceTint,
    };
  }
}
