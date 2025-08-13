import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ChipsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ChipsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelSmall;

    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FdChip(child: Text('Unselected', style: textStyle)),
          FdChip(
            variant: FdChipVariant.selected,
            child: Text('Selected', style: textStyle),
          ),
          FdChip(
            variant: FdChipVariant.unselectedDimmed,
            child: Text('Unselected Dimmed', style: textStyle),
          ),
          FdChip(
            borderColor: Colors.redAccent,
            backgroundColor: Colors.greenAccent,
            child: Text('Custom', style: textStyle),
          ),
        ],
      ),
    );
  }
}
