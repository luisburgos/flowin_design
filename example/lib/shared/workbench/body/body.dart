import 'package:flutter/material.dart';

/// @no-doc
class WorkbenchBody extends StatelessWidget {
  /// @no-doc
  const WorkbenchBody({
    required this.modulePane,
    required this.propertyPane,
    required this.agentChatPane,
    required this.child,
    super.key,
  });

  /// @no-doc
  final Widget modulePane;

  /// @no-doc
  final Widget propertyPane;

  /// @no-doc
  final Widget agentChatPane;

  /// @no-doc
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        modulePane,
        Expanded(child: child),
        propertyPane,
        agentChatPane,
      ],
    );
  }
}
