import 'package:example/modules/workbench/module_panes/components_module_pane.dart';
import 'package:example/modules/workbench/module_panes/foundations_module_pane.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// @no-doc
class ModulePaneBuilder extends StatelessWidget {
  /// @no-doc
  const ModulePaneBuilder({
    required this.sidebarItem,
    super.key,
    this.selectedFoundationsOption,
    this.selectedComponentsOption,
  });

  /// @no-doc
  final WorkbenchSideBarItem sidebarItem;

  /// @no-doc
  final FoundationsPaneOption? selectedFoundationsOption;

  /// @no-doc
  final ComponentsPaneOption? selectedComponentsOption;

  @override
  Widget build(BuildContext context) {
    if (sidebarItem.isFoundations) {
      return FoundationsPaneView(
        selected: selectedFoundationsOption,
        onOptionTap: (option) {
          Logger.instance.info('FoundationsPaneView.onOptionTap: $option');
          context.read<WorkbenchBloc>().add(
            SetFoundationsPaneOption(item: option),
          );
        },
      );
    }

    if (sidebarItem.isComponents) {
      return ComponentsPaneView(
        selected: selectedComponentsOption,
        onOptionTap: (option) {
          Logger.instance.info('ComponentsPaneView.onOptionTap: $option');
          context.read<WorkbenchBloc>().add(
            SetComponentsPaneOption(option: option),
          );
        },
      );
    }

    return Center(child: Text(sidebarItem.label));
  }
}
