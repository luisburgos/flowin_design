import 'package:example/modules/workbench/module_panes/foundations_module_pane.dart';
import 'package:example/modules/workbench/shortcuts/shortcut_intents.dart';
import 'package:example/modules/workbench/shortcuts/shortcut_spec.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/services.dart';

/// @no-doc
const LogicalKeyboardKey alt = LogicalKeyboardKey.alt;

/// @no-doc
const LogicalKeyboardKey altLeft = LogicalKeyboardKey.altLeft;

/// @no-doc
const LogicalKeyboardKey altRight = LogicalKeyboardKey.altRight;

/// @no-doc
final List<ShortcutSpec> workbenchShortcutsSpecs = <ShortcutSpec>[
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.digit2,
    intent: TogglePaneIntent(WorkbenchPane.left),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.digit3,
    intent: TogglePaneIntent(WorkbenchPane.right),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.digit4,
    intent: TogglePaneIntent(WorkbenchPane.rightExtra),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.keyQ,
    intent: SetSidebarIntent(WorkbenchSideBarItem.components),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.keyW,
    intent: SetSidebarIntent(WorkbenchSideBarItem.foundations),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.keyE,
    intent: SetSidebarIntent(WorkbenchSideBarItem.settings),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.keyA,
    intent: SetThemeModulePaneIntent(FoundationsPaneOption.colors),
  ),
  const ShortcutSpec(
    modifiers: [alt, altLeft, altRight],
    key: LogicalKeyboardKey.keyS,
    intent: SetThemeModulePaneIntent(FoundationsPaneOption.typography),
  ),
];
