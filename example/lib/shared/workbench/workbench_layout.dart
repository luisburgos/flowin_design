import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class WorkbenchLayout extends StatelessWidget {
  /// @no-doc
  const WorkbenchLayout({
    required this.topBar,
    required this.bottomBar,
    required this.sideBar,
    required this.body,
    super.key,
  });

  /// @no-doc
  final Widget topBar;

  /// @no-doc
  final Widget bottomBar;

  /// @no-doc
  final Widget sideBar;

  /// @no-doc
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topBar,
          const FDDivider(),
          Expanded(
            child: Row(
              children: [
                sideBar,
                Expanded(child: body),
              ],
            ),
          ),
          const FDDivider(),
          bottomBar,
        ],
      ),
    );
  }
}
