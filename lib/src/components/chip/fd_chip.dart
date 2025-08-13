import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';

/// @no-doc
enum FdChipVariant {
  /// Chosen chip in a group.
  selected,

  /// Non-selected chip.
  unselected,

  /// Non-selected chip with reduced emphasis.
  unselectedDimmed;

  /// @no-doc
  bool get isSelected => this == FdChipVariant.selected;

  /// @no-doc
  double get opacity {
    switch (this) {
      case FdChipVariant.selected:
      case FdChipVariant.unselected:
        return 1;
      case FdChipVariant.unselectedDimmed:
        return 0.5;
    }
  }
}

/// @no-doc
class FdChip extends StatelessWidget {
  /// @no-doc
  const FdChip({
    this.variant = FdChipVariant.unselected,
    this.onTap,
    this.borderColor,
    this.backgroundColor,
    this.child,
    this.border,
    this.constraints,
    this.padding,
    this.margin,
    super.key,
  });

  /// @no-doc
  final FdChipVariant variant;

  /// @no-doc
  final Widget? child;

  /// @no-doc
  final VoidCallback? onTap;

  /// @no-doc
  final Border? border;

  /// @no-doc
  final BoxConstraints? constraints;

  /// @no-doc
  final EdgeInsetsGeometry? padding;

  /// @no-doc
  final EdgeInsetsGeometry? margin;

  /// @no-doc
  final Color? backgroundColor;

  /// @no-doc
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBackgroundColor =
        backgroundColor ??
        (variant.isSelected
            ? colorScheme.secondaryContainer
            : Colors.transparent);

    final effectiveBorderColor =
        borderColor ??
        (variant.isSelected
            ? effectiveBackgroundColor
            : colorScheme.secondaryContainer);

    final effectiveBorder =
        border ??
        Border.all(
          color: effectiveBorderColor,
        );

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: variant.opacity,
        child: Container(
          constraints: constraints,
          padding: padding ?? const EdgeInsets.all(FlowinDesignSpace.space400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(FlowinDesignRadius.full),
            color: effectiveBackgroundColor,
            border: effectiveBorder,
          ),
          child: child,
        ),
      ),
    );
  }

  /// @no-doc
  FdChip copyWith({
    FdChipVariant? variant,
    VoidCallback? onTap,
  }) {
    return FdChip(
      variant: variant ?? this.variant,
      onTap: onTap ?? this.onTap,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      border: border,
      constraints: constraints,
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}
