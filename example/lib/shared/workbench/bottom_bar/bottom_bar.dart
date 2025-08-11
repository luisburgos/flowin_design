import 'package:example/shared/workbench/constants.dart';
import 'package:flutter/material.dart';

/// @no-doc
class WorkbenchBottomBar extends StatelessWidget {
  /// @no-doc
  const WorkbenchBottomBar({required this.width, super.key});

  /// @no-doc
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: wbPanePadding,
          color: Theme.of(context).colorScheme.surface,
          height: wbBottomBarHeight,
          width: width,
        ),
      ],
    );
  }
}
