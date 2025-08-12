import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
const wbDividerWidth = 1.5;

/// @no-doc
const wbDividerThickness = 1.5;

/// @no-doc
const double wbTopBarMinHeight = 48.0 + wbPaneVerticalPadding;

/// @no-doc
const double wbBottomBarHeight = 48.0 + wbPaneVerticalPadding;

/// @no-doc
const double wbSideBarWidth = 48 + wbPaneHorizontalPadding;

/// @no-doc
const wbPaneVerticalPadding = 12.0;

/// @no-doc
const wbPaneHorizontalPadding = 20.0;

/// @no-doc
const wbDefaultCollapsedPaneWidth = 40.0;

/// @no-doc
final wbDefaultBorderRadius = BorderRadius.circular(8);

/// @no-doc
const wbPanePadding = EdgeInsets.symmetric(
  vertical: FlowinDesignSpace.space100,
  horizontal: FlowinDesignSpace.space400,
);

/// @no-doc
const wbDefaultSideBarPadding = EdgeInsets.all(12);

/// @no-doc
final ButtonStyle wbSmallButtonStyle = IconButton.styleFrom(
  iconSize: 14,
  shape: RoundedRectangleBorder(borderRadius: wbDefaultBorderRadius),
  padding: const EdgeInsets.all(4),
  fixedSize: const Size(28, 28),
);

/// @no-doc
final ButtonStyle wbMediumButtonStyle = IconButton.styleFrom(
  iconSize: 20,
  shape: RoundedRectangleBorder(borderRadius: wbDefaultBorderRadius),
  padding: const EdgeInsets.all(4),
  fixedSize: const Size(40, 40),
);

/// @no-doc
ButtonStyle segmentedButtonStyle(ColorScheme colorScheme) {
  return ButtonStyle(
    backgroundColor: _resolve<Color?>(
      selected: colorScheme.onPrimary,
      notSelected: colorScheme.surfaceContainer,
    ),
    foregroundColor: _resolve<Color?>(
      selected: colorScheme.primary,
      notSelected: colorScheme.outline,
    ),
    overlayColor: _resolve<Color?>(
      selected: colorScheme.onPrimary.withValues(alpha: .12),
      notSelected: colorScheme.primary.withValues(alpha: .05),
    ),
    side: _resolve<BorderSide?>(
      selected: BorderSide(color: colorScheme.surfaceContainer, width: 0.8),
      notSelected: BorderSide(color: colorScheme.surfaceContainer, width: 0.8),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: wbDefaultBorderRadius),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
  );
}

WidgetStateProperty<T?> _resolve<T>({T? selected, T? notSelected}) {
  return WidgetStateProperty.resolveWith<T?>(
    (states) => states.contains(WidgetState.selected) ? selected : notSelected,
  );
}
