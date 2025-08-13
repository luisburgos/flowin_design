import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class TabsComponentShowcase extends StatefulWidget {
  /// @no-doc
  const TabsComponentShowcase({super.key});

  @override
  State<TabsComponentShowcase> createState() => _TabsComponentShowcaseState();
}

class _TabsComponentShowcaseState extends State<TabsComponentShowcase>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const FDTabItem(
        index: 0,
        title: 'Title',
        icon: Icon(Icons.square_outlined),
      ),
      FDTabItem(index: 1, title: 'Title', icon: FDIcons.board.toIcon()),
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

/// @no-doc
extension on FDIcons {
  /// @no-doc
  FDIcon toIcon({FlowinDesignIconSize? size}) {
    return FDIcon(icon: this, size: size);
  }
}
