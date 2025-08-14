// intents.dart or where you keep your Focus/Intent classes
import 'package:example/modules/workbench/module_panes/foundations_module_pane.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/widgets.dart';

/// @no-doc
class SetSidebarIntent extends Intent {
  /// @no-doc
  const SetSidebarIntent(this.item);

  /// @no-doc
  final WorkbenchSideBarItem item;
}

/// @no-doc
class TogglePaneIntent extends Intent {
  /// @no-doc
  const TogglePaneIntent(this.pane);

  /// @no-doc
  final WorkbenchPane pane;
}

/// @no-doc
class SetThemeModulePaneIntent extends Intent {
  /// @no-doc
  const SetThemeModulePaneIntent(this.pane);

  /// @no-doc
  final FoundationsPaneOption pane;
}
