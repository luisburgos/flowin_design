import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

final fdDefaultTestTabs = [
  FDTabItem(
    index: 0,
    title: 'Board',
    icon: FDIcons.board.toIcon(size: FlowinDesignIconSize.sm),
  ),
  FDTabItem(
    index: 1,
    title: 'Timeline',
    icon: FDIcons.timeline.toIcon(size: FlowinDesignIconSize.sm),
  ),
];

/// @no-doc
class FDDefaultTestTabController extends StatefulWidget {
  /// @no-doc
  const FDDefaultTestTabController({
    required this.builder,
    this.tabs,
    super.key,
  });

  /// @no-doc
  final List<FDTabItem>? tabs;

  /// @no-doc
  final Widget Function(TabController controller, List<Widget> tabs) builder;

  @override
  State<FDDefaultTestTabController> createState() =>
      _FDDefaultTestTabControllerState();
}

class _FDDefaultTestTabControllerState extends State<FDDefaultTestTabController>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller = TabController(
      length: widget.tabs?.length ?? fdDefaultTestTabs.length,
      vsync: this,
    );
    return widget.builder(controller, widget.tabs ?? fdDefaultTestTabs);
  }
}
