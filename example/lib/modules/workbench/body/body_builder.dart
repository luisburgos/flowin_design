import 'package:example/modules/components/app_bar.dart';
import 'package:example/modules/components/buttons.dart';
import 'package:example/modules/components/cards.dart';
import 'package:example/modules/components/chip_groups.dart';
import 'package:example/modules/components/chips.dart';
import 'package:example/modules/components/icon_buttons.dart';
import 'package:example/modules/components/item_buttons.dart';
import 'package:example/modules/components/tabs.dart';
import 'package:example/modules/foundations/colors.dart';
import 'package:example/modules/foundations/icons.dart';
import 'package:example/modules/foundations/typography.dart';
import 'package:example/modules/workbench/module_panes/theme_module_pane.dart';
import 'package:example/modules/workbench/module_panes/widget_tree_module_pane.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:flutter/material.dart';

/// @no-doc
class BodyBuilder extends StatelessWidget {
  /// @no-doc
  const BodyBuilder({required this.state, super.key});

  /// @no-doc
  final WorkbenchState state;

  @override
  Widget build(BuildContext context) {
    Logger.instance.info(
      'Building body for ${state.selectedFoundationsOption}',
    );
    if (state.sidebarItem?.isFoundations ?? false) {
      switch (state.selectedFoundationsOption) {
        case FoundationsPaneOption.colors:
          return const FoundationsColorsShowcase();
        case FoundationsPaneOption.typography:
          return const FoundationsTypographyShowcase();
        case FoundationsPaneOption.icons:
          return const FoundationsIconsShowcase();
        case null:
          break;
      }
    }

    if (state.sidebarItem?.isComponents ?? false) {
      switch (state.selectedComponentsOption) {
        case null:
          break;
        case ComponentsPaneOption.buttons:
          return const WidgetTreeButtonsBody();
        case ComponentsPaneOption.iconButtons:
          return const WidgetTreeIconButtonsBody();
        case ComponentsPaneOption.itemButtons:
          return const WidgetTreeItemButtonsBody();
        case ComponentsPaneOption.tabs:
          return const WidgetTreeTabsBody();
        case ComponentsPaneOption.appBar:
          return const AppBarComponentBody();
        case ComponentsPaneOption.chip:
          return const ChipsComponentShowcase();
        case ComponentsPaneOption.chipGroup:
          return const ChipGroupsComponentShowcase();
        case ComponentsPaneOption.cards:
          return const CardsComponentShowcase();
      }
    }

    return Center(
      child: Text(
        state.sidebarItem?.label ?? 'No sidebar item',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
