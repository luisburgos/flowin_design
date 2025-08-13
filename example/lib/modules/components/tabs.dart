import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class WidgetTreeTabsBody extends StatefulWidget {
  /// @no-doc
  const WidgetTreeTabsBody({super.key});

  @override
  State<WidgetTreeTabsBody> createState() => _WidgetTreeTabsBodyState();
}

class _WidgetTreeTabsBodyState extends State<WidgetTreeTabsBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const FDTabItem(
        index: 0,
        title: 'Title',
        icon: Icon(Icons.square_outlined),
      ),
      FDTabItem(index: 1, title: 'Title', icon: const FDIcons().split),
    ];

    final controller = TabController(length: tabs.length, vsync: this);

    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: FDTabs(controller: controller, tabs: tabs),
          ),
        ],
      ),
    );
  }
}
