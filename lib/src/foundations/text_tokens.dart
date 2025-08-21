import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A typography class that defines all Flowin text tokens
/// using Inter as the base font.
class FlowinBaselineTextTokens {
  /// @no-doc
  static TextStyle get headlineSmall => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 32 / 24,
    letterSpacing: -0.05,
  );

  /// @no-doc
  static TextStyle get titleLarge => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 24 / 20,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get titleMedium => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 22 / 16,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get titleSmall => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    height: 22 / 14,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get labelLarge => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 16 / 16,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get labelMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 14 / 14,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get labelSmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 12 / 12,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get captionLarge => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500, // Medium
    height: 20 / 12,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get captionMedium => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400, // Regular
    height: 16 / 10,
    letterSpacing: 0.2,
  );
}

/// @no-doc
const supremeFontFamily = 'Supreme';

/// A typography class for Flowin’s brand text tokens using the custom
/// `Supreme` font (added via pubspec.yaml).
class FlowinBrandTextTokens {
  /// @no-doc
  static TextStyle get displayXL => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 160,
    fontWeight: FontWeight.w700, // Bold
    height: 1,
    letterSpacing: -2,
  );

  /// @no-doc
  static TextStyle get displayLG => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 80,
    fontWeight: FontWeight.w700, // Bold
    height: 1,
    letterSpacing: -1,
  );

  /// @no-doc
  static TextStyle get headlineLarge => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w700, // Bold
    height: 56 / 48,
    letterSpacing: 0,
  );

  /// @no-doc
  static TextStyle get headlineSmall => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700, // Bold
    height: 32 / 24,
    letterSpacing: 0.2,
  );

  /// @no-doc
  static TextStyle get titleMedium => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700, // Bold
    height: 24 / 16,
    letterSpacing: 0.2,
  );

  /// @no-doc
  static TextStyle get titleSmall => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700, // Bold
    height: 20 / 14,
    letterSpacing: 0.2,
  );

  /// @no-doc
  static TextStyle get bodyLarge => const TextStyle(
    fontFamily: supremeFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    height: 24 / 16,
    letterSpacing: 0.5,
  );
}
