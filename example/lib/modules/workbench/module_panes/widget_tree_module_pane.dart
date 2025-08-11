import 'package:example/modules/workbench/module_panes/module_pane_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
enum ComponentsPaneOption {
  /// @no-doc
  tabs,

  /// @no-doc
  iconButtons,

  /// @no-doc
  itemButtons,

  /// @no-doc
  buttons;

  /// @no-doc
  String get id {
    switch (this) {
      case ComponentsPaneOption.iconButtons:
        return 'iconButtons';
      case ComponentsPaneOption.buttons:
        return 'buttons';
      case ComponentsPaneOption.itemButtons:
        return 'itemButtons';
      case ComponentsPaneOption.tabs:
        return 'tabs';
    }
  }

  /// @no-doc
  static ComponentsPaneOption? fromId(String? id) {
    if (id == null) return null;
    if (id == 'tabs') return ComponentsPaneOption.tabs;
    if (id == 'buttons') return ComponentsPaneOption.buttons;
    if (id == 'iconButtons') return ComponentsPaneOption.iconButtons;
    if (id == 'itemButtons') return ComponentsPaneOption.itemButtons;
    throw Exception('Invalid WidgetTreeModulePaneOption id: $id');
  }

  /// @no-doc
  bool get isButtons => this == ComponentsPaneOption.buttons;

  /// @no-doc
  String get label {
    switch (this) {
      case ComponentsPaneOption.buttons:
        return 'Buttons';
      case ComponentsPaneOption.iconButtons:
        return 'Icon Buttons';
      case ComponentsPaneOption.itemButtons:
        return 'Item Buttons';
      case ComponentsPaneOption.tabs:
        return 'Tabs';
    }
  }

  /// @no-doc
  IconData get iconData {
    switch (this) {
      case ComponentsPaneOption.buttons:
        return LucideIcons.rectangleCircle;
      case ComponentsPaneOption.iconButtons:
        return LucideIcons.squaresExclude;
      case ComponentsPaneOption.itemButtons:
        return LucideIcons.list;
      case ComponentsPaneOption.tabs:
        return LucideIcons.notebookTabs;
    }
  }
}

/// @no-doc
class ComponentsPaneView extends StatelessWidget {
  /// @no-doc
  const ComponentsPaneView({
    required this.onOptionTap,
    this.selected,
    super.key,
  });

  /// @no-doc
  final ComponentsPaneOption? selected;

  /// @no-doc
  final void Function(ComponentsPaneOption) onOptionTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ComponentsPaneOption.values.map((option) {
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
