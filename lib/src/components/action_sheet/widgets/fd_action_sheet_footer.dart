import 'package:flutter/material.dart';

/// @no-doc
class FDActionSheetFooter extends StatelessWidget {
  /// @no-doc
  const FDActionSheetFooter({
    required this.left,
    required this.right,
    super.key,
  });

  /// @no-doc
  final Widget? left;

  /// @no-doc
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (left != null)
          Expanded(
            child: left!,
          ),
        Expanded(child: right),
      ],
    );
  }
}
