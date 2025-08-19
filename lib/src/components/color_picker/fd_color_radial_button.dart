import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDColorRadialButton extends StatelessWidget {
  /// @no-doc
  const FDColorRadialButton({
    required this.color,
    this.size = FlowinDesignSpace.space700,
    this.selected = false,
    this.borderWidth = FlowinDesignBorders.extraBold,
    this.gapWidth = FlowinDesignBorders.bold,
    this.gapColor,
    this.onTap,
    this.outerCircleDecoration,
    super.key,
  });

  /// @no-doc
  const FDColorRadialButton.gradient({
    required this.color,
    this.size = FlowinDesignSpace.space700,
    this.selected = false,
    this.borderWidth = FlowinDesignBorders.extraBold,
    this.gapWidth = FlowinDesignBorders.bold,
    this.gapColor,
    this.onTap,
    super.key,
  }) : outerCircleDecoration = const BoxDecoration(
         shape: BoxShape.circle,
         gradient: SweepGradient(
           colors: [
             Colors.greenAccent,
             Colors.yellow,
             Colors.orange,
             Colors.red,
             Colors.purple,
             Colors.blue,
             Colors.cyan,
             Colors.greenAccent,
           ],
         ),
       );

  /// @no-doc
  final Color color;

  /// @no-doc
  final double size;

  /// @no-doc
  final bool selected;

  /// @no-doc
  final double borderWidth;

  /// @no-doc
  final double gapWidth;

  /// @no-doc
  final Color? gapColor;

  /// @no-doc
  final VoidCallback? onTap;

  /// @no-doc
  final BoxDecoration? outerCircleDecoration;

  @override
  Widget build(BuildContext context) {
    final effectiveGapColor = gapColor ?? Theme.of(context).colorScheme.surface;

    final outerCircleSize = size;
    final middleCircleSize = outerCircleSize - 2 * borderWidth;
    final innerCircleSize = middleCircleSize - 2 * gapWidth;

    // Guard against negative sizes
    assert(
      innerCircleSize >= 0,
      'Invalid size: $size. The size must be at least twice the sum of '
      'borderWidth ($borderWidth) and gapWidth ($gapWidth).',
    );

    const shape = CircleBorder();

    return Material(
      color: Colors.transparent,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: onTap,
        child: SizedBox.square(
          dimension: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Base filled circle (default state is just this)
              _ColoredCircle(
                size: outerCircleSize,
                color: color,
                decoration: outerCircleDecoration,
              ),

              if (selected) ...[
                // Carve the outer colored ring by overlaying the
                // [effectiveGapColor].
                // This leaves a colored ring of [borderWidth].
                _ColoredCircle(
                  size: middleCircleSize,
                  color: effectiveGapColor,
                ),

                // Now place the inner circle.
                _ColoredCircle(size: innerCircleSize, color: color),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ColoredCircle extends StatelessWidget {
  const _ColoredCircle({
    required this.size,
    required this.color,
    this.decoration,
  });

  /// @no-doc
  final double size;

  /// @no-doc
  final Color color;

  /// @no-doc
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration:
            decoration ??
            BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
      ),
    );
  }
}
