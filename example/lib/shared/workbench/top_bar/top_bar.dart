import 'package:example/shared/workbench/constants.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:example/shared/workbench/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// @no-doc
class WorkbenchTopBar extends StatelessWidget {
  /// @no-doc
  const WorkbenchTopBar({
    required this.title,
    required this.height,
    required this.visiblePanes,
    required this.onVisiblePanesChanged,
    super.key,
  });

  /// @no-doc
  final Widget title;

  /// @no-doc
  final double height;

  /// @no-doc
  final Set<WorkbenchPane> visiblePanes;

  /// @no-doc
  final ValueChanged<Set<WorkbenchPane>> onVisiblePanesChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: height),
      padding: wbPanePadding,
      child: Row(
        children: [
          title,
          const Spacer(),
          WorkbenchPaneToggle(
            visiblePanes: visiblePanes,
            onChanged: onVisiblePanesChanged,
          ),
        ],
      ),
    );
  }
}
