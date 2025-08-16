import 'package:flowin_design/src/foundations/foundations.dart';

/// @no-doc
enum FDButtonSize {
  /// @no-doc
  xs,

  /// @no-doc
  sm,

  /// @no-doc
  md;

  /// @no-doc
  static const FDButtonSize defaultSize = FDButtonSize.sm;

  /// @no-doc
  double get fixedSize => switch (this) {
    xs => 32,
    sm => 40,
    md => 56,
  };

  /// @no-doc
  double get padding => switch (this) {
    xs => 8,
    sm => 4,
    md => 0,
  };

  /// @no-doc
  FlowinDesignIconSize get iconSize => switch (this) {
    xs => FlowinDesignIconSize.sm,
    sm => FlowinDesignIconSize.md,
    md => FlowinDesignIconSize.lg,
  };
}
