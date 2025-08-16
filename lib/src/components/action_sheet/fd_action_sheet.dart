import 'package:flowin_design/src/components/action_sheet/widgets/fd_action_sheet_header.dart';
import 'package:flutter/cupertino.dart';

/// @no-doc
class FDActionSheet extends StatelessWidget {
  /// @no-doc
  const FDActionSheet({
    required this.title,
    this.displayClose = true,
    this.subtitle,
    this.headerIcon,
    super.key,
  });

  /// @no-doc
  final String title;

  ///@no-doc
  final String? subtitle;

  ///@no-doc
  final Widget? headerIcon;

  ///@no-doc
  final bool displayClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FDActionSheetHeader(
          title: title,
          subtitle: subtitle,
          displayClose: displayClose,
          icon: headerIcon,
          onClose: () {},
        ),
      ],
    );
  }
}
