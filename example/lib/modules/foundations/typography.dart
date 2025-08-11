import 'package:flutter/material.dart';

/// @no-doc
class ThemeTypographyBody extends StatelessWidget {
  /// @no-doc
  const ThemeTypographyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Typography',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
