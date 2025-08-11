import 'package:example/modules/workbench/shortcuts/shortcut_intents.dart';
import 'package:example/modules/workbench/shortcuts/shortcut_spec.dart';
import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// @no-doc
class ShortcutsBuilder {
  /// @no-doc
  static Map<LogicalKeySet, Intent> buildShortcuts(
    Iterable<ShortcutSpec> specs,
  ) {
    final map = <LogicalKeySet, Intent>{};
    for (final spec in specs) {
      map[LogicalKeySet.fromSet({...spec.modifiers, spec.key})] = spec.intent;
    }
    return Map.unmodifiable(map);
  }

  /// @no-doc
  static Map<Type, Action<Intent>> buildActions(BuildContext context) => {
    TogglePaneIntent: CallbackAction<TogglePaneIntent>(
      onInvoke: (intent) {
        context.read<WorkbenchBloc>().add(TogglePane(intent.pane));
        return null;
      },
    ),
    SetSidebarIntent: CallbackAction<SetSidebarIntent>(
      onInvoke: (intent) {
        context.read<WorkbenchBloc>().add(SetSidebarItem(intent.item));
        return null;
      },
    ),
    SetThemeModulePaneIntent: CallbackAction<SetThemeModulePaneIntent>(
      onInvoke: (intent) {
        context.read<WorkbenchBloc>().add(
          SetFoundationsPaneOption(
            pane: WorkbenchSideBarItem.foundations,
            item: intent.pane,
          ),
        );
        return null;
      },
    ),
  };
}
