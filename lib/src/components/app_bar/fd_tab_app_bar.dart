import 'package:flowin_design/src/components/components.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDTabAppBar extends StatelessWidget {
  /// @no-doc
  const FDTabAppBar({
    required this.controller,
    required this.tabs,
    required this.leading,
    required this.trailing,
    super.key,
  });

  /// @no-doc
  final TabController controller;

  /// @no-doc
  final List<Widget> tabs;

  /// @no-doc
  final Widget leading;

  /// @no-doc
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            ColoredBox(
              color: Colors.transparent,
              child: leading,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ColoredBox(
                color: Colors.transparent,
                child: FDTabs(
                  controller: controller,
                  tabs: tabs,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ColoredBox(
              color: Colors.transparent,
              child: trailing,
            ),
            const SizedBox(width: 8),
          ],
        ),
        const Divider(
          height: 0,
          thickness: 0.3,
        ),
      ],
    );
  }
}
