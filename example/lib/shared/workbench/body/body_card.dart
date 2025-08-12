import 'package:flutter/material.dart';

/// @no-doc
class BodyCard extends StatelessWidget {
  /// @no-doc
  const BodyCard({required this.child, this.padding, super.key});

  /// @no-doc
  final Widget child;

  /// @no-doc
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(24),
        child: Card(elevation: 5, child: child),
      ),
    );
  }
}
