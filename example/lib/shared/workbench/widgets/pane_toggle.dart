import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class WorkbenchPaneToggle extends StatelessWidget {
  /// @no-doc
  const WorkbenchPaneToggle({
    required this.visiblePanes,
    required this.onChanged,
    super.key,
  });

  /// @no-doc
  final Set<WorkbenchPane> visiblePanes;

  /// @no-doc
  final ValueChanged<Set<WorkbenchPane>> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<WorkbenchPane>(
      multiSelectionEnabled: true,
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      selected: visiblePanes,
      onSelectionChanged: onChanged,
      segments: [
        paneButtonSegment(
          context: context,
          value: WorkbenchPane.left,
          tooltip: 'Toggle Module Panel',
          shortcut: '⌥ 2',
          iconData: LucideIcons.panelLeft,
        ),
        paneButtonSegment(
          context: context,
          value: WorkbenchPane.right,
          tooltip: 'Toggle Property Panel',
          shortcut: '⌥ 3',
          iconData: LucideIcons.panelRight,
        ),
        paneButtonSegment(
          context: context,
          value: WorkbenchPane.rightExtra,
          tooltip: 'Toggle Agent Chat',
          shortcut: '⌥ 4',
          iconData: LucideIcons.sparkle,
        ),
      ],
    );
  }
}

/// @no-doc
ButtonSegment<WorkbenchPane> paneButtonSegment({
  required BuildContext context,
  required WorkbenchPane value,
  required String tooltip,
  required String shortcut,
  required IconData iconData,
}) {
  final theme = Theme.of(context);

  return ButtonSegment<WorkbenchPane>(
    value: value,
    icon: Tooltip(
      richMessage: TextSpan(
        children: [
          TextSpan(text: '$tooltip '),
          TextSpan(
            text: shortcut,
            style: TextStyle(
              color: theme.colorScheme.outlineVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      child: Icon(iconData),
    ),
  );
}
