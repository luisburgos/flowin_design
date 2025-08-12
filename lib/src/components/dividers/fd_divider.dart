import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FdDivider extends StatelessWidget {
  /// @no-doc
  const FdDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: FlowinDesignSpace.space50,
    );
  }
}

/// @no-doc
class FdVerticalDivider extends StatelessWidget {
  /// @no-doc
  const FdVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      width: FlowinDesignSpace.space50,
    );
  }
}
