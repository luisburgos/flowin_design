import 'package:flowin_design/src/components/buttons/fd_button_size.dart';
import 'package:flowin_design/src/components/buttons/fd_button_variant.dart';
import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';

/// @no-doc
({Color? backgroundColor, Color? foregroundColor}) getFDButtonVariantColors(
  BuildContext context, {
  required FDButtonVariant variant,
}) {
  Color? foregroundColor;
  Color? backgroundColor;

  final colorScheme = Theme.of(context).colorScheme;

  switch (variant) {
    case FDButtonVariant.filled:
      backgroundColor = colorScheme.primary;
      foregroundColor = colorScheme.onPrimary;
    case FDButtonVariant.tonal:
      backgroundColor = colorScheme.secondaryContainer;
      foregroundColor = colorScheme.onSecondaryContainer;
    case FDButtonVariant.text:
      backgroundColor = Colors.transparent;
      foregroundColor = colorScheme.primary;
    case FDButtonVariant.destructive:
      backgroundColor = colorScheme.errorContainer;
      foregroundColor = colorScheme.onErrorContainer;
  }

  return (
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );
}

/// @no-doc
TextStyle? getVariantSizeTextStyle(
  BuildContext context, {
  required FDButtonSize size,
}) {
  final textTheme = Theme.of(context).textTheme;
  return switch (size) {
    FDButtonSize.xs => textTheme.labelSmall,
    FDButtonSize.sm => textTheme.labelMedium,
    FDButtonSize.md => textTheme.labelLarge,
  };
}

/// @no-doc
EdgeInsets getVariantSizePadding(
  BuildContext context, {
  required FDButtonSize size,
}) {
  return switch (size) {
    FDButtonSize.xs => const EdgeInsets.symmetric(
      horizontal: FlowinDesignSpace.space300,
      vertical: FlowinDesignSpace.space200,
    ),
    FDButtonSize.sm => const EdgeInsets.symmetric(
      horizontal: FlowinDesignSpace.space400,
      vertical: FlowinDesignSpace.space250,
    ),
    FDButtonSize.md => const EdgeInsets.symmetric(
      horizontal: FlowinDesignSpace.space600,
      vertical: FlowinDesignSpace.space400,
    ),
  };
}
