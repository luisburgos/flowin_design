import 'package:example/modules/components/widgets/fd_default_test_tab_controller.dart';
import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class TabsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const TabsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: FDDefaultTestTabController(
              builder: (controller, tabs) {
                return FDTabs(controller: controller, tabs: tabs);
              },
            ),
          ),
        ],
      ),
    );
  }
}
