import 'package:flutter/material.dart';

/// @no-doc
class PropertyPaneBuilder extends StatelessWidget {
  /// @no-doc
  const PropertyPaneBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Property',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
