import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class WorkbenchTopBarTitle extends StatelessWidget {
  /// @no-doc
  const WorkbenchTopBarTitle({
    required this.title,
    required this.onIconTap,
    super.key,
  });

  /// @no-doc
  final String title;

  /// @no-doc
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        GestureDetector(
          onTap: onIconTap,
          child: Container(
            height: 32,
            width: 32,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
              color: Colors.transparent,
            ),
            child: Icon(
              LucideIcons.cuboid400,
              size: 20,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
