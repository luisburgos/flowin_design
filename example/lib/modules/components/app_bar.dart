import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class AppBarComponentBody extends StatelessWidget {
  /// @no-doc
  const AppBarComponentBody({super.key});

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
        ],
      ),
    );
  }
}
