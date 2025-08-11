import 'package:flutter/material.dart';

/// @no-doc
class BodyCard extends StatelessWidget {
  /// @no-doc
  const BodyCard({
    required this.child,
    super.key,
  });

  /// @no-doc
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 5,
          child: child,
        ),
      ),
    );
  }
}
