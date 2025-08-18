import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ShowcaseCard extends StatelessWidget {
  /// @no-doc
  const ShowcaseCard({
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.cornerRadius,
    super.key,
  });

  /// @no-doc
  final Widget child;

  /// @no-doc
  final EdgeInsets? padding;

  /// @no-doc
  final EdgeInsets? margin;

  /// @no-doc
  final Color? backgroundColor;

  /// @no-doc
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return FDCard(
      margin: margin ?? const EdgeInsets.all(FlowinDesignSpace.space600),
      padding: padding ?? const EdgeInsets.all(FlowinDesignSpace.space600),
      shadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: FlowinDesignRadius.radius100,
          offset: const Offset(0, 2),
        ),
      ],
      cornerRadius: cornerRadius ?? FlowinDesignRadius.radius300,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      child: child,
    );
  }
}
