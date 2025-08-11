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
  static const FlowinDesignIconSize defaultSize = FlowinDesignIconSize.md;
}
