import 'package:flowin_design/src/components/buttons/fd_button_size.dart';
import 'package:flowin_design/src/components/buttons/fd_button_utils.dart';
import 'package:flowin_design/src/components/buttons/fd_button_variant.dart';
import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDItemButton extends StatelessWidget {
  /// @no-doc
  const FDItemButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = FDButtonVariant.tonal,
    super.key,
  });

  /// @no-doc
  const FDItemButton.destructive({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = FDButtonVariant.destructive,
    super.key,
  });

  /// @no-doc
  final String label;

  /// @no-doc
  final VoidCallback onPressed;

  /// @no-doc
  final Widget? icon;

  /// @no-doc
  final FDButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final style = styleFrom(
      context,
      variant: variant,
      size: FDButtonSize.md,
    );

    return FilledButton.icon(
      onPressed: onPressed,
      style: style,
      icon: icon,
      label: Text(label),
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
      alignment: Alignment.centerLeft,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FlowinDesignRadius.radius400),
      ),
      padding: const EdgeInsets.all(16),
      minimumSize: Size(281, size.fixedSize),
      iconSize: size.iconSize.value,
      foregroundColor: colors.foregroundColor,
      backgroundColor: colors.backgroundColor,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
  }
}
