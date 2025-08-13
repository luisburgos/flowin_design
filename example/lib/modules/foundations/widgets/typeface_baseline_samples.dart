import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class TypefaceBaselineSamples extends StatelessWidget {
  /// @no-doc
  const TypefaceBaselineSamples({super.key});

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
