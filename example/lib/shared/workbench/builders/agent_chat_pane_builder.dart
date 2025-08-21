import 'package:flutter/material.dart';

/// @no-doc
class AgentChatPaneBuilder extends StatelessWidget {
  /// @no-doc
  const AgentChatPaneBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Agent Chat',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
