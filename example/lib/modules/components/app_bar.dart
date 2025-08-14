import 'package:example/modules/components/widgets/fd_default_test_tab_controller.dart';
import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class AppBarComponentShowcase extends StatelessWidget {
  /// @no-doc
  const AppBarComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: FDAppBar(
              leading: FDButton.text(label: 'Cancel', onPressed: () {}),
              trailing: FDButton(label: 'Done', onPressed: () {}),
            ),
          ),
          SizedBox(
            width: 400,
            child: FDDefaultTestTabController(
              builder: (controller, tabs) => FDTabAppBar(
                trailing: FDIconButton.text(
                  icon: FDIcon(icon: FDIcons.share),
                  onPressed: () {},
                ),
                controller: controller,
                tabs: tabs,
              ),
            ),
          ),
          SizedBox(
            width: 400,
            child: FDDefaultTestTabController(
              builder: (controller, tabs) => FDTabAppBar(
                leading: FDIconButton.text(
                  icon: FDIcon(icon: FDIcons.back),
                  onPressed: () {},
                ),
                trailing: FDIconButton.text(
                  icon: FDIcon(icon: FDIcons.share),
                  onPressed: () {},
                ),
                controller: controller,
                tabs: tabs,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
