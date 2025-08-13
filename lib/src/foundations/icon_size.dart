/// @no-doc
enum FlowinDesignIconSize {
  /// Extra-Small
  xs(12),

  /// Small
  sm(16),

  /// Medium
  md(20),

  /// Large
  lg(24),

  /// Extra-Large
  xl(32),

  /// Extra-Extra-Large
  xxl(40);

  /// @no-doc
  const FlowinDesignIconSize(this.value);

  /// @no-doc
  final double value;

  /// @no-doc
  static FlowinDesignIconSize? fromValue(int value) {
    return FlowinDesignIconSize.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid icon size value'),
    );
  }

  /// @no-doc
  double get stroke {
    switch (this) {
      case FlowinDesignIconSize.xs:
        return 1.25;
      case FlowinDesignIconSize.sm:
        return 1.5;
      case FlowinDesignIconSize.md:
        return 1.75;
      case FlowinDesignIconSize.lg:
        return 2;
      case FlowinDesignIconSize.xl:
        return 2.5;
      case FlowinDesignIconSize.xxl:
        return 3;
    }
  }

  /// @no-doc
  static const FlowinDesignIconSize defaultSize = FlowinDesignIconSize.md;
}
