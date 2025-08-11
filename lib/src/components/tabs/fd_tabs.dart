import 'package:flowin_design/src/components/tabs/fd_tab_item.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDTabs extends StatelessWidget {
  /// @no-doc
  const FDTabs({
    required this.controller,
    required this.tabs,
    super.key,
  });

  /// @no-doc
  final TabController controller;

  /// @no-doc
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      tabs: tabs
          .map(
            (tab) => tab is FDTabItem
                ? FDTabItem(
                    index: tab.index,
                    title: tab.title,
                    icon: tab.icon,
                  )
                : tab,
          )
          .toList(),
    );
  }
}
