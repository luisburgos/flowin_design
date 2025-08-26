import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
const double fdDefaultTabItemHeight = FlowinDesignSpace.space1400;

/// @no-doc
class FDTabs extends StatelessWidget {
  /// @no-doc
  const FDTabs({
    required this.controller,
    required this.tabs,
    this.itemHeight,
    super.key,
  });

  /// @no-doc
  final TabController controller;

  /// @no-doc
  final List<Widget> tabs;

  /// @no-doc
  final double? itemHeight;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = itemHeight ?? fdDefaultTabItemHeight;

    return PreferredSize(
      preferredSize: Size.fromHeight(effectiveHeight),
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: tabs
            .map(
              (tab) => tab is FDTabItem
                  ? FDTabItem(
                      height: effectiveHeight,
                      index: tab.index,
                      title: tab.title,
                      icon: tab.icon,
                    )
                  : tab,
            )
            .toList(),
      ),
    );
  }
}
