import 'package:flowin_design/src/components/buttons/fd_button_size.dart';
import 'package:flowin_design/src/components/buttons/fd_button_utils.dart'
    show getVariantColors;
import 'package:flowin_design/src/components/buttons/fd_button_variant.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDIconButton extends StatelessWidget {
  /// @no-doc
  const FDIconButton({
    required this.onPressed,
    required this.icon,
    this.variant = FDButtonVariant.filled,
    this.size = FDButtonSize.defaultSize,
    super.key,
  });

  /// @no-doc
  final VoidCallback onPressed;

  /// @no-doc
  final Widget icon;

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

    return IconButton(
      onPressed: onPressed,
      style: style,
      icon: icon,
    );
  }

  /// @no-doc
  static ButtonStyle styleFrom(
    BuildContext context, {
    required FDButtonVariant variant,
    FDButtonSize size = FDButtonSize.defaultSize,
  }) {
    final colors = getVariantColors(context, variant: variant);
    return IconButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      minimumSize: Size(size.fixedSize, size.fixedSize),
      fixedSize: Size.square(size.fixedSize),
      iconSize: size.iconSize.value,
      backgroundColor: colors.backgroundColor,
      foregroundColor: colors.foregroundColor,
    );
  }
}
