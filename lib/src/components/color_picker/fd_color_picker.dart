import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDColorPicker extends StatelessWidget {
  /// @no-doc
  const FDColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// @no-doc
class FDGradientCircle extends StatelessWidget {
  /// @no-doc
  const FDGradientCircle({
    required this.color,
    required this.size,
    super.key,
  });

  /// @no-doc
  final Color color;

  /// @no-doc
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
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
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Container(
          margin: const EdgeInsets.all(3),
          child: FDColorCircle(
            color: color,
            borderColor: Colors.transparent,
            size: size - 6,
            borderWidth: 0,
            isSelected: false,
          ),
        ),
      ),
    );
  }
}

/// @no-doc
class FDColorCircle extends StatelessWidget {
  /// @no-doc
  const FDColorCircle({
    required this.color,
    required this.borderColor,
    required this.size,
    required this.isSelected,
    this.borderWidth = FlowinDesignBorders.bold,
    super.key,
  });

  /// @no-doc
  final Color color;

  /// @no-doc
  final Color borderColor;

  /// @no-doc
  final double size;

  /// @no-doc
  final double borderWidth;

  /// @no-doc
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? borderColor : Colors.transparent,
          width: borderWidth,
        ),
      ),
    );
  }
}
