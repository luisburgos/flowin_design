import 'package:flowin_design/flowin_design.dart';
import 'package:flowin_design/src/components/action_sheet/widgets/fd_action_sheet_header.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDActionSheet extends StatelessWidget {
  /// @no-doc
  const FDActionSheet({
    required this.title,
    this.displayClose = true,
    this.subtitle,
    this.headerIcon,
    this.body,
    this.footer,
    this.onClose,
    this.margin,
    super.key,
  });

  /// @no-doc
  final String title;

  ///@no-doc
  final String? subtitle;

  ///@no-doc
  final Widget? body;

  ///@no-doc
  final Widget? footer;

  ///@no-doc
  final Widget? headerIcon;

  ///@no-doc
  final bool displayClose;

  ///@no-doc
  final VoidCallback? onClose;

  ///@no-doc
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return FDCard(
      margin:
          margin ??
          const EdgeInsets.only(
            top: FlowinDesignSpace.space800,
            bottom: FlowinDesignSpace.space600,
            left: FlowinDesignSpace.space400,
            right: FlowinDesignSpace.space400,
          ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      cornerRadius: FlowinDesignRadius.radius1000,
      padding: const EdgeInsets.all(FlowinDesignSpace.space600),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: FlowinDesignSpace.space400,
        children: [
          FDActionSheetHeader(
            title: title,
            subtitle: subtitle,
            displayClose: displayClose,
            icon: headerIcon,
            onClose:
                onClose ??
                () {
                  context.popDefaultActionSheet();
                },
          ),
          if (body != null)
            ColoredBox(
              color: Colors.transparent,
              child: body,
            ),
          if (footer != null) ...[
            ColoredBox(
              color: Colors.transparent,
              child: footer,
            ),
          ],
        ],
      ),
    );
  }
}
