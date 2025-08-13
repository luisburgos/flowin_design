import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class TypefaceBrandSamples extends StatelessWidget {
  /// @no-doc
  const TypefaceBrandSamples({super.key});

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
