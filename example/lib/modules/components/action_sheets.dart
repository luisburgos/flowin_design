import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ActionSheetsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ActionSheetsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: FDActionSheet(
              title: 'Descriptive Title',
              subtitle:
                  'Write something in here that gives clear '
                  'directions to the user',
            ),
          ),
        ],
      ),
    );
  }
}
