import 'package:flowin_design/flowin_design.dart';
import 'package:flowin_design/src/components/buttons/fd_button_utils.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDButton extends StatelessWidget {
  /// @no-doc
  const FDButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = FDButtonVariant.filled,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  });

  /// @no-doc
  const FDButton.text({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = FDButtonVariant.text,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  });

  /// @no-doc
  const FDButton.tonal({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = FDButtonVariant.tonal,
    this.size = FDButtonSize.defaultSize,
    this.padding,
    super.key,
  });

  /// @no-doc
  final String label;

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
    final colors = getVariantColors(context, variant: variant);

    final style = styleFrom(
      context,
      variant: variant,
      size: size,
      foregroundColor: colors.foregroundColor,
      backgroundColor: colors.backgroundColor,
    );
    final textTheme = Theme.of(context).textTheme;

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
                  Text(
                    label,
                    style: textTheme.labelLarge?.copyWith(
                      color: colors.foregroundColor,
                    ),
                  ),
                ],
              )
            : Text(label),
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
