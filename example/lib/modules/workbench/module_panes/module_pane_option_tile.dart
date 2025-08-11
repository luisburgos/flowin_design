import 'package:example/shared/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class ModulePaneOptionTile extends StatelessWidget {
  /// @no-doc
  const ModulePaneOptionTile({
    required this.name,
    required this.onPressed,
    this.leadingIcon,
    this.isSelected = false,
    super.key,
  });

  /// @no-doc
  final bool isSelected;

  /// @no-doc
  final IconData? leadingIcon;

  /// @no-doc
  final String name;

  /// @no-doc
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Logger.instance.info('ModulePaneOptionTile.isSelected: $isSelected');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                if (leadingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      leadingIcon,
                      size: 14,
                      color: isSelected ? Colors.blueAccent : null,
                    ),
                  ),
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? Colors.blueAccent
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Icon(LucideIcons.chevronRight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
