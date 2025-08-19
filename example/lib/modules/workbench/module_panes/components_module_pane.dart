import 'package:example/modules/workbench/module_panes/module_pane_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
enum ComponentsPaneOption {
  /// @no-doc
  actionSheets,

  /// @no-doc
  appBar,

  /// @no-doc
  tabs,

  /// @no-doc
  chip,

  /// @no-doc
  chipGroup,

  /// @no-doc
  iconButtons,

  /// @no-doc
  itemButtons,

  /// @no-doc
  cards,

  /// @no-doc
  inputFields,

  /// @no-doc
  buttons;

  /// Options NOT ready for production.
  bool get isEnabled {
    switch (this) {
      case ComponentsPaneOption.chipGroup:
        return false;
      default:
        return true;
    }
  }

  /// @no-doc
  String get id {
    switch (this) {
      case ComponentsPaneOption.appBar:
        return 'appBar';
      case ComponentsPaneOption.iconButtons:
        return 'iconButtons';
      case ComponentsPaneOption.buttons:
        return 'buttons';
      case ComponentsPaneOption.itemButtons:
        return 'itemButtons';
      case ComponentsPaneOption.tabs:
        return 'tabs';
      case ComponentsPaneOption.chip:
        return 'chip';
      case ComponentsPaneOption.chipGroup:
        return 'chipGroup';
      case ComponentsPaneOption.cards:
        return 'cards';
      case ComponentsPaneOption.actionSheets:
        return 'actionSheets';
      case ComponentsPaneOption.inputFields:
        return 'inputFields';
    }
  }

  /// @no-doc
  static ComponentsPaneOption? fromId(String? id) {
    if (id == null) return null;
    if (id == 'appBar') return ComponentsPaneOption.appBar;
    if (id == 'tabs') return ComponentsPaneOption.tabs;
    if (id == 'chip') return ComponentsPaneOption.chip;
    if (id == 'chipGroup') return ComponentsPaneOption.chipGroup;
    if (id == 'buttons') return ComponentsPaneOption.buttons;
    if (id == 'iconButtons') return ComponentsPaneOption.iconButtons;
    if (id == 'itemButtons') return ComponentsPaneOption.itemButtons;
    if (id == 'cards') return ComponentsPaneOption.cards;
    if (id == 'actionSheets') return ComponentsPaneOption.actionSheets;
    if (id == 'inputFields') return ComponentsPaneOption.inputFields;
    throw Exception('Invalid WidgetTreeModulePaneOption id: $id');
  }

  /// @no-doc
  bool get isButtons => this == ComponentsPaneOption.buttons;

  /// @no-doc
  String get label {
    switch (this) {
      case ComponentsPaneOption.appBar:
        return 'App Bar';
      case ComponentsPaneOption.buttons:
        return 'Buttons';
      case ComponentsPaneOption.iconButtons:
        return 'Icon Buttons';
      case ComponentsPaneOption.itemButtons:
        return 'Item Buttons';
      case ComponentsPaneOption.tabs:
        return 'Tabs';
      case ComponentsPaneOption.chip:
        return 'Chip';
      case ComponentsPaneOption.chipGroup:
        return 'Chip Group';
      case ComponentsPaneOption.cards:
        return 'Cards';
      case ComponentsPaneOption.actionSheets:
        return 'Action Sheets';
      case ComponentsPaneOption.inputFields:
        return 'Input Fields';
    }
  }

  /// @no-doc
  IconData get iconData {
    switch (this) {
      case ComponentsPaneOption.appBar:
        return LucideIcons.lineSquiggle;
      case ComponentsPaneOption.buttons:
        return LucideIcons.rectangleCircle;
      case ComponentsPaneOption.iconButtons:
        return LucideIcons.squaresExclude;
      case ComponentsPaneOption.itemButtons:
        return LucideIcons.list;
      case ComponentsPaneOption.tabs:
        return LucideIcons.notebookTabs;
      case ComponentsPaneOption.chip:
        return LucideIcons.tag;
      case ComponentsPaneOption.chipGroup:
        return LucideIcons.tags;
      case ComponentsPaneOption.cards:
        return LucideIcons.cardSim;
      case ComponentsPaneOption.actionSheets:
        return LucideIcons.list;
      case ComponentsPaneOption.inputFields:
        return LucideIcons.text;
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
      children: ComponentsPaneOption.values
          .where((option) => option.isEnabled)
          .map((option) {
            return ModulePaneOptionTile(
              isSelected: option == selected,
              name: option.label,
              leadingIcon: option.iconData,
              onPressed: () => onOptionTap(option),
            );
          })
          .toList(),
    );
  }
}
