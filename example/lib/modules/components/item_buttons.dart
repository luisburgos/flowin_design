import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class ItemButtonsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ItemButtonsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FDButtonVariant.tonal,
          FDButtonVariant.destructive,
        ].map(_StoriesForVariant.new).toList(),
      ),
    );
  }
}

class _StoriesForVariant extends StatelessWidget {
  const _StoriesForVariant(this.variant);

  final FDButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return FDItemButton(
      icon: const Icon(LucideIcons.settings2),
      label: 'Label',
      variant: variant,
      onPressed: () {},
    );
  }
}
