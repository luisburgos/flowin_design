import 'package:example/shared/workbench/body/body_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ChipGroupsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ChipGroupsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelSmall;

    return BodyCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FdChipGroup(
            chips: [
              FdChip(child: Text('Item A', style: textStyle)),
              FdChip(child: Text('Item B', style: textStyle)),
              FdChip(child: Text('Item C', style: textStyle)),
            ],
          ),
          FdChipGroup(
            unselectedVariant: FdChipVariant.unselectedDimmed,
            chips: [
              FdChip(child: Text('Item A', style: textStyle)),
              FdChip(child: Text('Item B', style: textStyle)),
              FdChip(child: Text('Item C', style: textStyle)),
            ],
          ),
          FdChipGroup(
            initialSelected: FdChip(
              variant: FdChipVariant.selected,
              child: Text('Item B', style: textStyle),
            ),
            unselectedVariant: FdChipVariant.unselectedDimmed,
            chips: [
              FdChip(child: Text('Item A', style: textStyle)),
              FdChip(
                variant: FdChipVariant.selected,
                child: Text('Item B', style: textStyle),
              ),
              FdChip(child: Text('Item C', style: textStyle)),
            ],
          ),
        ],
      ),
    );
  }
}
