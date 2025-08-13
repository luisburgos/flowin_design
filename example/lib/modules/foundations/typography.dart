import 'package:example/modules/foundations/widgets/typeface_baseline_samples.dart';
import 'package:example/modules/foundations/widgets/typeface_brand_samples.dart';
import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FoundationsTypographyShowcase extends StatelessWidget {
  /// @no-doc
  const FoundationsTypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: FDChipGroupViewPager(
        chipFactory: (context, label) => FdChip(
          child: Text(label, style: Theme.of(context).textTheme.labelSmall),
        ),
        items: [
          FDChipGroupViewPage(
            label: 'Baseline',
            builder: (_) => TypefaceBaselineSamples(),
          ),
          FDChipGroupViewPage(
            label: 'Brand',
            builder: (_) => TypefaceBrandSamples(),
          ),
        ],
      ),
    );
  }
}
