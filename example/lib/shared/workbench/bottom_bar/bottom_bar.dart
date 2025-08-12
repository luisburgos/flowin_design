import 'package:example/shared/easy_version/easy_app_version.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class WorkbenchBottomBar extends StatelessWidget {
  /// @no-doc
  const WorkbenchBottomBar({required this.width, super.key});

  /// @no-doc
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: FlowinDesignSpace.space100,
        horizontal: FlowinDesignSpace.space400,
      ),
      color: Theme.of(context).colorScheme.surface,
      height: FlowinDesignSpace.space800,
      width: width,
      child: Row(children: [Spacer(), EasyAppVersion()]),
    );
  }
}
