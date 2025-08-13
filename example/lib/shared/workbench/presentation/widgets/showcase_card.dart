import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ShowcaseCard extends StatelessWidget {
  /// @no-doc
  const ShowcaseCard({required this.child, this.padding, super.key});

  /// @no-doc
  final Widget child;

  /// @no-doc
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return FDCard(
      padding: padding ?? const EdgeInsets.all(FlowinDesignSpace.space600),
      shadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: FlowinDesignRadius.radius100,
          offset: const Offset(0, 2),
        ),
      ],
      cornerRadius: FlowinDesignRadius.radius300,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }
}
