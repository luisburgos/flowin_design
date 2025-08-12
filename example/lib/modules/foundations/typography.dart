import 'package:example/modules/foundations/widgets/typefaces_samples.dart';
import 'package:example/shared/workbench/body/body_card.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ThemeTypographyBody extends StatelessWidget {
  /// @no-doc
  const ThemeTypographyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyCard(child: TypefacesSamples());
  }
}
