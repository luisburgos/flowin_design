import 'package:example/modules/workbench/module_panes/module_pane_builder.dart';
import 'package:example/modules/workbench/shortcuts/shortcuts.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/bloc/listeners/on_module_pane_section_changed.dart';
import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:example/shared/workbench/body/body.dart';
import 'package:example/shared/workbench/bottom_bar/bottom_bar.dart';
import 'package:example/shared/workbench/builders/agent_chat_pane_builder.dart';
import 'package:example/shared/workbench/builders/property_pane_builder.dart';
import 'package:example/shared/workbench/constants.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:example/shared/workbench/presentation/widgets/expandable_pane.dart';
import 'package:example/shared/workbench/side_bar/side_bar.dart';
import 'package:example/shared/workbench/top_bar/top_bar.dart';
import 'package:example/shared/workbench/top_bar/top_bar_title.dart';
import 'package:example/shared/workbench/workbench_layout.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class WorkbenchView extends StatelessWidget {
  /// @no-doc
  const WorkbenchView({
    required this.title,
    required this.body,
    required this.state,
    super.key,
  });

  /// @no-doc
  final String title;

  /// @no-doc
  final WorkbenchState state;

  /// @no-doc
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final showModulePane = state.visiblePanes.contains(WorkbenchPane.left);
    final showPropertyPane = state.visiblePanes.contains(WorkbenchPane.right);
    final showAgentChatPane = state.visiblePanes.contains(
      WorkbenchPane.rightExtra,
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final bodyHeight = height;

    final effectiveSidebarItem =
        state.sidebarItem ?? WorkbenchSideBarItem.components;

    Logger.instance.info('effectiveSidebarItem: $effectiveSidebarItem');
    Logger.instance.info(
      'selectedThemeOption: ${state.selectedFoundationsOption}',
    );

    return Scaffold(
      body: OnWorkbenchStateChanged(
        child: WorkbenchShortcuts(
          onTogglePane: (context, pane) {
            context.read<WorkbenchBloc>().add(TogglePane(pane));
          },
          child: WorkbenchLayout(
            topBar: WorkbenchTopBar(
              title: WorkbenchTopBarTitle(
                title: title,
                onIconTap: () {
                  context.read<WorkbenchBloc>().add(
                    TogglePane(WorkbenchPane.sideBar),
                  );
                },
              ),
              height: wbTopBarMinHeight,
              visiblePanes: state.visiblePanes,
              onVisiblePanesChanged: (values) {
                for (final pane in WorkbenchPane.values) {
                  context.read<WorkbenchBloc>().add(
                    values.contains(pane) ? OpenPane(pane) : MinimizePane(pane),
                  );
                }
              },
            ),
            bottomBar: WorkbenchBottomBar(width: width),
            sideBar: ExpandablePane(
              isExpanded: state.visiblePanes.contains(WorkbenchPane.sideBar),
              icon: const Icon(LucideIcons.chevronRight),
              closeIcon: LucideIcons.chevronLeft,
              rightDivider: const FDVerticalDivider(),
              height: bodyHeight,
              expandedWidth: 60,
              onOpenPressed: () {
                context.read<WorkbenchBloc>().add(
                  OpenPane(WorkbenchPane.sideBar),
                );
              },
              onMinimizePressed: () {
                context.read<WorkbenchBloc>().add(
                  MinimizePane(WorkbenchPane.sideBar),
                );
              },
              child: WorkbenchSideBar(
                selectedItem: effectiveSidebarItem,
                height: bodyHeight,
                onItemChanged: (item) {
                  Logger.instance.info('onItemChanged: $item');
                  context.read<WorkbenchBloc>().add(SetSidebarItem(item));
                },
              ),
            ),
            body: WorkbenchBody(
              modulePane: ExpandablePane(
                name: state.sidebarItem?.label ?? 'No sidebar item selected',
                isExpanded: showModulePane,
                icon: const Icon(LucideIcons.panelLeft),
                leftDivider: const SizedBox.shrink(),
                rightDivider: const FDVerticalDivider(),
                height: bodyHeight,
                expandedWidth: 220,
                onOpenPressed: () => context.read<WorkbenchBloc>().add(
                  OpenPane(WorkbenchPane.left),
                ),
                onMinimizePressed: () => context.read<WorkbenchBloc>().add(
                  MinimizePane(WorkbenchPane.left),
                ),
                child: ModulePaneBuilder(
                  sidebarItem: effectiveSidebarItem,
                  selectedFoundationsOption: state.selectedFoundationsOption,
                  selectedComponentsOption: state.selectedComponentsOption,
                ),
              ),
              propertyPane: ExpandablePane(
                name: 'Properties',
                isExpanded: showPropertyPane,
                icon: const Icon(LucideIcons.panelRight),
                height: bodyHeight,
                leftDivider: const FDVerticalDivider(),
                expandedWidth: 220,
                onOpenPressed: () => context.read<WorkbenchBloc>().add(
                  OpenPane(WorkbenchPane.right),
                ),
                onMinimizePressed: () => context.read<WorkbenchBloc>().add(
                  MinimizePane(WorkbenchPane.right),
                ),
                child: const PropertyPaneBuilder(),
              ),
              agentChatPane: ExpandablePane(
                name: 'Agent/Chat',
                isExpanded: showAgentChatPane,
                leftDivider: const FDVerticalDivider(),
                icon: const Icon(LucideIcons.sparkles),
                height: bodyHeight,
                expandedWidth: 300,
                child: const AgentChatPaneBuilder(),
                onOpenPressed: () => context.read<WorkbenchBloc>().add(
                  OpenPane(WorkbenchPane.rightExtra),
                ),
                onMinimizePressed: () => context.read<WorkbenchBloc>().add(
                  MinimizePane(WorkbenchPane.rightExtra),
                ),
              ),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
