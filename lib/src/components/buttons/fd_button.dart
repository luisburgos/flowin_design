import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDButton extends StatelessWidget {
  /// @no-doc
  const FDButton({
    required this.onPressed,
    this.child,
    this.label,
    this.icon,
    this.variant = FDButtonVariant.filled,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  }) : assert(
         label != null || child != null,
         'Either label or child must be provided',
       );

  /// @no-doc
  const FDButton.text({
    required this.onPressed,
    this.child,
    this.label,
    this.icon,
    this.variant = FDButtonVariant.text,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  }) : assert(
         label != null || child != null,
         'Either label or child must be provided',
       );

  /// @no-doc
  const FDButton.tonal({
    required this.onPressed,
    this.child,
    this.label,
    this.icon,
    this.variant = FDButtonVariant.tonal,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  }) : assert(
         label != null || child != null,
         'Either label or child must be provided',
       );

  /// @no-doc
  const FDButton.destructive({
    required this.onPressed,
    this.child,
    this.label,
    this.icon,
    this.variant = FDButtonVariant.destructive,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  }) : assert(
         label != null || child != null,
         'Either label or child must be provided',
       );

  /// @no-doc
  final String? label;

  /// @no-doc
  final Widget? child;

  /// @no-doc
  final VoidCallback onPressed;

  /// @no-doc
  final Widget? icon;

  /// @no-doc
  final FDButtonSize size;

  /// @no-doc
  final FDButtonVariant variant;

  /// @no-doc
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colors = getFDButtonVariantColors(context, variant: variant);

    final style = styleFrom(
      context,
      variant: variant,
      size: size,
      foregroundColor: colors.foregroundColor,
      backgroundColor: colors.backgroundColor,
    );
    final textTheme = Theme.of(context).textTheme;

    final effectiveChild =
        child ??
        Text(
          label!,
          style: textTheme.labelLarge?.copyWith(
            color: colors.foregroundColor,
          ),
        );

    return Container(
      color: Colors.transparent,
      padding: padding ?? EdgeInsets.symmetric(vertical: size.padding),
      child: FilledButton(
        onPressed: onPressed,
        style: style,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: FlowinDesignSpace.space200,
                children: [
                  icon!,
                  effectiveChild,
                ],
              )
            : effectiveChild,
      ),
    );
  }

  /// @no-doc
  static ButtonStyle styleFrom(
    BuildContext context, {
    required FDButtonVariant variant,
    FDButtonSize size = FDButtonSize.defaultSize,
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    return FilledButton.styleFrom(
      padding: getVariantSizePadding(context, size: size),
      minimumSize: Size(0, size.fixedSize),
      iconSize: size.iconSize.value,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      textStyle: getVariantSizeTextStyle(context, size: size),
    );
  }
}
