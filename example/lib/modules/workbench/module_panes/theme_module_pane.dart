import 'package:example/modules/workbench/module_panes/module_pane_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
enum FoundationsPaneOption {
  /// @no-doc
  colors,

  /// @no-doc
  typography,

  /// @no-doc
  icons;

  //themeWidgets;
  /// @no-doc
  String get id {
    switch (this) {
      case FoundationsPaneOption.colors:
        return 'colors';
      case FoundationsPaneOption.typography:
        return 'typography';
      case FoundationsPaneOption.icons:
        return 'icons';
    }
  }

  /// @no-doc
  static FoundationsPaneOption? fromId(String? id) {
    if (id == null) return null;
    if (id == 'colors') return FoundationsPaneOption.colors;
    if (id == 'icons') return FoundationsPaneOption.icons;
    if (id == 'typography') return FoundationsPaneOption.typography;
    throw Exception('Invalid ThemeModulePaneOption id: $id');
  }

  /// @no-doc
  bool get isColors => this == FoundationsPaneOption.colors;

  /// @no-doc
  String get label {
    switch (this) {
      case FoundationsPaneOption.colors:
        return 'Colors';
      case FoundationsPaneOption.typography:
        return 'Typography';
      case FoundationsPaneOption.icons:
        return 'Icons';
    }
  }

  /// @no-doc
  IconData get iconData {
    switch (this) {
      case FoundationsPaneOption.colors:
        return LucideIcons.pipette;
      case FoundationsPaneOption.typography:
        return LucideIcons.typeOutline;
      case FoundationsPaneOption.icons:
        return LucideIcons.flag;
    }
  }
}

/// @no-doc
class FoundationsPaneView extends StatelessWidget {
  /// @no-doc
  const FoundationsPaneView({
    required this.onOptionTap,
    this.selected,
    super.key,
  });

  /// @no-doc
  final FoundationsPaneOption? selected;

  /// @no-doc
  final void Function(FoundationsPaneOption) onOptionTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: FoundationsPaneOption.values.map((option) {
        return ModulePaneOptionTile(
          isSelected: option == selected,
          name: option.label,
          leadingIcon: option.iconData,
          onPressed: () => onOptionTap(option),
        );
      }).toList(),
    );
  }
}
