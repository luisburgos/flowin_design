import 'package:example/modules/foundations/widgets/choice_chip_selector.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

class TypefacesSamples extends StatelessWidget {
  const TypefacesSamples({super.key});

  @override
  Widget build(BuildContext context) {
    return ChipPageView(
      items: [
        ChipPageItem(label: 'Baseline', builder: (_) => _BaselineSamples()),
        ChipPageItem(label: 'Brand', builder: (_) => _BrandSamples()),
      ],
    );
  }
}

class _BaselineSamples extends StatelessWidget {
  const _BaselineSamples();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(FlowinDesignSpace.space100),
      child: SingleChildScrollView(
        child: Column(
          spacing: FlowinDesignSpace.space200,
          children: [
            Text('Baseline Typeface: Inter', style: textTheme.headlineLarge),
            Divider(),
            Text('Headline Small', style: textTheme.headlineSmall),
            Text('Title Large', style: textTheme.titleLarge),
            Text('Title Medium', style: textTheme.titleMedium),
            Text('Title Small', style: textTheme.titleSmall),
            Text('Body Large', style: textTheme.bodyLarge),
            Text('Body Medium', style: textTheme.bodyMedium),
            Text('Label Large', style: textTheme.labelLarge),
            Text('Label Medium', style: textTheme.labelMedium),
            Text('Label Small', style: textTheme.labelSmall),
            Text('Caption Large', style: textTheme.captionLarge),
            Text('Caption Medium', style: textTheme.captionMedium),
          ],
        ),
      ),
    );
  }
}

class _BrandSamples extends StatelessWidget {
  const _BrandSamples();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(FlowinDesignSpace.space100),
      child: SingleChildScrollView(
        child: Column(
          spacing: FlowinDesignSpace.space100,
          children: [
            Text(
              'Brand Typeface: Supreme',
              style: textTheme.brandHeadlineLarge.copyWith(fontSize: 56),
            ),
            Divider(),
            Text('Display XL', style: textTheme.brandDisplayXL),
            Text('Display LG', style: textTheme.brandDisplayLG),
            Text('Headline Large', style: textTheme.brandHeadlineLarge),
            Text('Headline Small', style: textTheme.brandHeadlineSmall),
            Text('Title Medium', style: textTheme.brandTitleMedium),
            Text('Title Small', style: textTheme.brandTitleSmall),
            Text('Body Large', style: textTheme.brandBodyLarge),
          ],
        ),
      ),
    );
  }
}
