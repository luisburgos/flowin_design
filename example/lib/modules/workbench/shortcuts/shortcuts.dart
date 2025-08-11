import 'package:example/modules/workbench/shortcuts/shortcuts_builder.dart';
import 'package:example/modules/workbench/shortcuts/shortcuts_specs.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/material.dart';

/// @no-doc
class WorkbenchShortcuts extends StatelessWidget {
  /// @no-doc
  const WorkbenchShortcuts({
    required this.child,
    required this.onTogglePane,
    super.key,
  });

  /// @no-doc
  final Widget child;

  /// @no-doc
  final void Function(BuildContext, WorkbenchPane) onTogglePane;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: ShortcutsBuilder.buildShortcuts(workbenchShortcutsSpecs),
      child: Actions(
        actions: ShortcutsBuilder.buildActions(context),
        child: Focus(autofocus: true, child: child),
      ),
    );
  }
}
