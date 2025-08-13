import 'package:flowin_design/src/components/chip/fd_chip.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FdChipGroup extends StatefulWidget {
  /// @no-doc
  const FdChipGroup({
    required this.chips,
    this.initialSelected,
    this.onItemTap,
    this.unselectedVariant,
    super.key,
  });

  /// @no-doc
  final List<FdChip> chips;

  /// @no-doc
  final FdChip? initialSelected;

  /// @no-doc
  final FdChipVariant? unselectedVariant;

  /// @no-doc
  final void Function(FdChip)? onItemTap;

  @override
  State<FdChipGroup> createState() => _FdChipGroupState();
}

class _FdChipGroupState extends State<FdChipGroup> {
  FdChip? selected;

  @override
  void initState() {
    selected = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.chips.map((chip) {
        // TODO(luis): fix initialSelected not being selected
        if (chip == selected) {
          return chip.copyWith(variant: FdChipVariant.selected);
        }
        return chip.copyWith(
          variant: widget.unselectedVariant ?? FdChipVariant.unselected,
          onTap: () {
            setState(() {
              selected = chip;
              widget.onItemTap?.call(chip);
            });
          },
        );
      }).toList(),
    );
  }
}
