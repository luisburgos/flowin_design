import 'package:example/shared/workbench/constants.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class WorkbenchSideBar extends StatelessWidget {
  /// @no-doc
  const WorkbenchSideBar({
    required this.selectedItem,
    required this.height,
    required this.onItemChanged,
    super.key,
  });

  /// @no-doc
  final WorkbenchSideBarItem selectedItem;

  /// @no-doc
  final double height;

  /// @no-doc
  final void Function(WorkbenchSideBarItem) onItemChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseStyle = wbMediumButtonStyle.copyWith(
      foregroundColor: WidgetStatePropertyAll(colorScheme.outline),
    );
    final selectedStyle = baseStyle.copyWith(
      foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
      backgroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
      shadowColor: WidgetStatePropertyAll(
        colorScheme.primaryContainer.withValues(alpha: 0.3),
      ),
      elevation: const WidgetStatePropertyAll(6),
    );

    return Container(
      padding: wbDefaultSideBarPadding,
      color: Theme.of(context).colorScheme.surface,
      height: height,
      width: wbSideBarWidth,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              onItemChanged(WorkbenchSideBarItem.components);
            },
            icon: const Icon(LucideIcons.listTree),
            style: selectedItem.isComponents ? selectedStyle : baseStyle,
          ),
          const SizedBox(height: 8),
          IconButton(
            onPressed: () {
              onItemChanged(WorkbenchSideBarItem.foundations);
            },
            icon: const Icon(LucideIcons.palette),
            style: selectedItem.isFoundations ? selectedStyle : baseStyle,
          ),
          const SizedBox(height: 8),
          IconButton(
            onPressed: () {
              onItemChanged(WorkbenchSideBarItem.settings);
            },
            icon: const Icon(LucideIcons.settings),
            style: selectedItem.isSettings ? selectedStyle : baseStyle,
          ),
        ],
      ),
    );
  }
}
