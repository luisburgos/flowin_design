import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class IconButtonsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const IconButtonsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: FDButtonVariant.values.map(_StoriesForVariant.new).toList(),
      ),
    );
  }
}

class _StoriesForVariant extends StatelessWidget {
  const _StoriesForVariant(this.variant);

  final FDButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: FlowinDesignSpace.space300,
      children: FDButtonSize.values
          .map(
            (size) => FDIconButton(
              icon: const Icon(LucideIcons.ship),
              variant: variant,
              size: size,
              onPressed: () {},
            ),
          )
          .toList(),
    );
  }
}
