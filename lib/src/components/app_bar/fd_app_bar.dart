import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDAppBar extends StatelessWidget {
  /// @no-doc
  const FDAppBar({
    required this.leading,
    required this.trailing,
    super.key,
  });

  /// @no-doc
  final Widget leading;

  /// @no-doc
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: FlowinDesignSpace.space200),
            ColoredBox(
              color: Colors.transparent,
              child: leading,
            ),
            const Spacer(),
            ColoredBox(
              color: Colors.transparent,
              child: trailing,
            ),
            const SizedBox(width: FlowinDesignSpace.space200),
          ],
        ),
      ],
    );
  }
}
