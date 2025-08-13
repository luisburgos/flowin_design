import 'package:figma_squircle/figma_squircle.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDCard extends StatelessWidget {
  /// @no-doc
  const FDCard({
    required this.child,
    required this.cornerRadius,
    this.borderSide = BorderSide.none,
    this.clipChild = false,
    this.size,
    this.backgroundColor,
    this.cornerSmoothing,
    this.margin,
    this.padding,
    this.shadows,
    super.key,
  });

  /// @no-doc
  final Widget child;

  /// @no-doc
  final double cornerRadius;

  /// @no-doc
  final BorderSide borderSide;

  /// @no-doc
  final Color? backgroundColor;

  /// @no-doc
  final double? cornerSmoothing;

  /// @no-doc
  final EdgeInsets? margin;

  /// @no-doc
  final EdgeInsets? padding;

  /// @no-doc
  final Size? size;

  /// @no-doc
  final List<BoxShadow>? shadows;

  /// @no-doc
  final bool clipChild;

  @override
  Widget build(BuildContext context) {
    final borderRadius = SmoothBorderRadius(
      cornerRadius: cornerRadius,
      cornerSmoothing: cornerSmoothing ?? FlowinDesignRadius.iOSSmooth,
    );

    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBackgroundColor =
        backgroundColor ?? colorScheme.secondaryContainer;

    return Container(
      width: size?.width,
      height: size?.height,
      margin: margin,
      padding: padding,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          side: borderSide,
          borderRadius: borderRadius,
        ),
        color: effectiveBackgroundColor,
        shadows: shadows,
      ),
      child: clipChild
          ? ClipSmoothRect(
              radius: borderRadius,
              child: child,
            )
          : child,
    );
  }
}
