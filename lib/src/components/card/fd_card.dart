import 'package:figma_squircle/figma_squircle.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDCardBorderRadius {
  /// @no-doc
  const FDCardBorderRadius({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  /// @no-doc
  const FDCardBorderRadius.all(double radius)
    : this(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      );

  /// @no-doc
  final double topLeft;

  /// @no-doc
  final double topRight;

  /// @no-doc
  final double bottomLeft;

  /// @no-doc
  final double bottomRight;
}

/// @no-doc
class FDCard extends StatelessWidget {
  /// @no-doc
  const FDCard({
    required this.child,
    required this.borderRadius,
    this.borderSide = BorderSide.none,
    this.clipChild = false,
    this.size,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.shadows,
    super.key,
  });

  /// @no-doc
  final Widget child;

  /// @no-doc
  final BorderSide borderSide;

  /// @no-doc
  final Color? backgroundColor;

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

  /// @no-doc
  final FDCardBorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = SmoothBorderRadius.only(
      topRight: SmoothRadius(
        cornerRadius: borderRadius.topRight,
        cornerSmoothing: FlowinDesignRadius.iOSSmooth,
      ),
      topLeft: SmoothRadius(
        cornerRadius: borderRadius.topLeft,
        cornerSmoothing: FlowinDesignRadius.iOSSmooth,
      ),
      bottomRight: SmoothRadius(
        cornerRadius: borderRadius.bottomRight,
        cornerSmoothing: FlowinDesignRadius.iOSSmooth,
      ),
      bottomLeft: SmoothRadius(
        cornerRadius: borderRadius.bottomLeft,
        cornerSmoothing: FlowinDesignRadius.iOSSmooth,
      ),
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
          borderRadius: effectiveBorderRadius,
        ),
        color: effectiveBackgroundColor,
        shadows: shadows,
      ),
      child: clipChild
          ? ClipSmoothRect(
              radius: effectiveBorderRadius,
              child: child,
            )
          : child,
    );
  }
}
