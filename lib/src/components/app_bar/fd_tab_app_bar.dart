import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDTabAppBar extends StatelessWidget {
  /// @no-doc
  const FDTabAppBar({
    required this.controller,
    required this.tabs,
    this.leading,
    this.trailing,
    this.dividerColor,
    super.key,
  });

  /// @no-doc
  final TabController controller;

  /// @no-doc
  final List<Widget> tabs;

  /// @no-doc
  final Widget? leading;

  /// @no-doc
  final Widget? trailing;

  /// @no-doc
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    final effectiveDividerColor =
        dividerColor ?? Theme.of(context).colorScheme.outlineVariant;

    return FDAppBar(
      leading: leading,
      trailing: trailing,
      footer: Divider(
        height: FlowinDesignBorders.regular,
        thickness: FlowinDesignBorders.regular,
        color: effectiveDividerColor,
      ),
      child: FDTabs(
        controller: controller,
        tabs: tabs,
      ),
    );
  }
}
