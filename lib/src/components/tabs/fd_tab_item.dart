import 'package:flutter/material.dart';

/// @no-doc
class FDTabItem extends StatelessWidget {
  /// @no-doc
  const FDTabItem({
    required this.index,
    required this.title,
    required this.icon,
    this.height = 56,
    super.key,
  });

  // TODO(luis): extract to theme
  /// @no-doc
  final double height;

  /// @no-doc
  final int index;

  /// @no-doc
  final String title;

  /// @no-doc
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
