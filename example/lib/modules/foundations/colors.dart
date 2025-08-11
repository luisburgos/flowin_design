import 'package:example/modules/foundations/widgets/color_grid_selector.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ThemeColorsBody extends StatelessWidget {
  /// @no-doc
  const ThemeColorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ColorGridSelector(
          lightSeed: Colors.teal,
          darkSeed: Colors.deepPurple,
        ),
      ),
    );
  }
}
