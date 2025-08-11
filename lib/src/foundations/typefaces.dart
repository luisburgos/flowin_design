import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// @no-doc
class FlowinTypefaces {
  /// @no-doc
  const FlowinTypefaces();

  /// @no-doc
  static TextTheme baseline() {
    return GoogleFonts.interTextTheme().copyWith(
      headlineSmall: FlowinBaselineTextTokens.headlineSmall,
      titleMedium: FlowinBaselineTextTokens.titleMedium,
      titleSmall: FlowinBaselineTextTokens.titleSmall,
      bodyLarge: FlowinBaselineTextTokens.bodyLarge,
      bodyMedium: FlowinBaselineTextTokens.bodyMedium,
      labelLarge: FlowinBaselineTextTokens.labelLarge,
      labelMedium: FlowinBaselineTextTokens.labelMedium,
      labelSmall: FlowinBaselineTextTokens.labelSmall,
    );
  }
}

/// @no-doc
extension FlowinBaselineTextTheme on TextTheme {
  /// @no-doc
  TextStyle get captionLarge => FlowinBaselineTextTokens.captionLarge;

  /// @no-doc
  TextStyle get captionMedium => FlowinBaselineTextTokens.captionMedium;
}

/// @no-doc
extension FlowinBrandTextTheme on TextTheme {
  /// @no-doc
  TextStyle get brandDisplayXL => FlowinBrandTextTokens.displayXL;

  /// @no-doc
  TextStyle get brandDisplayLG => FlowinBrandTextTokens.displayLG;

  /// @no-doc
  TextStyle get brandHeadlineLarge => FlowinBrandTextTokens.headlineLarge;

  /// @no-doc
  TextStyle get brandHeadlineSmall => FlowinBrandTextTokens.headlineSmall;

  /// @no-doc
  TextStyle get brandTitleMedium => FlowinBrandTextTokens.titleMedium;

  /// @no-doc
  TextStyle get brandBodyLarge => FlowinBrandTextTokens.bodyLarge;
}
