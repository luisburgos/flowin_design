import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDDivider extends StatelessWidget {
  /// @no-doc
  const FDDivider({
    this.color,
    this.thickness,
    super.key,
  });

  /// @no-doc
  final double? thickness;

  /// @no-doc
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: FlowinDesignSpace.space50,
      thickness: thickness,
      color: color ?? Theme.of(context).colorScheme.outlineVariant,
    );
  }
}

/// @no-doc
class FDVerticalDivider extends StatelessWidget {
  /// @no-doc
  const FDVerticalDivider({
    this.color,
    this.thickness,
    super.key,
  });

  /// @no-doc
  final double? thickness;

  /// @no-doc
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: FlowinDesignSpace.space50,
      thickness: thickness,
      color: color ?? Theme.of(context).colorScheme.outlineVariant,
    );
  }
}
