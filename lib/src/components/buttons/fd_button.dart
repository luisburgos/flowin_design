import 'package:flowin_design/src/components/buttons/fd_button_size.dart';
import 'package:flowin_design/src/components/buttons/fd_button_utils.dart';
import 'package:flowin_design/src/components/buttons/fd_button_variant.dart';
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
    super.key,
  });

  /// @no-doc
  const FDButton.text({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = FDButtonVariant.text,
    this.size = FDButtonSize.defaultSize,
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

  @override
  Widget build(BuildContext context) {
    final style = styleFrom(
      context,
      variant: variant,
      size: size,
    );

    return FilledButton(
      onPressed: onPressed,
      style: style,
      //icon: icon,
      child: Text(label),
    );
  }

  /// @no-doc
  static ButtonStyle styleFrom(
    BuildContext context, {
    required FDButtonVariant variant,
    FDButtonSize size = FDButtonSize.defaultSize,
  }) {
    final colors = getVariantColors(context, variant: variant);
    return FilledButton.styleFrom(
      padding: getVariantSizePadding(context, size: size),
      minimumSize: Size(0, size.fixedSize),
      iconSize: size.iconSize.value,
      foregroundColor: colors.foregroundColor,
      backgroundColor: colors.backgroundColor,
      textStyle: getVariantSizeTextStyle(context, size: size),
    );
  }
}
