import 'package:example/shared/workbench/constants.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class BasicPane extends StatelessWidget {
  /// @no-doc
  const BasicPane({
    required this.child,
    required this.name,
    required this.onMinimizePressed,
    this.width,
    super.key,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final double? width;

  /// @no-doc
  final Widget child;

  /// @no-doc
  final VoidCallback onMinimizePressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Row(
              children: [
                Text(name, style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                IconButton(
                  onPressed: onMinimizePressed,
                  icon: const Icon(LucideIcons.x),
                  style: wbSmallButtonStyle,
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
