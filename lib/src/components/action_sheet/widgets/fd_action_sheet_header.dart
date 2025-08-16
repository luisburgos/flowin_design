import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

///@no-doc
class FDActionSheetHeader extends StatelessWidget {
  ///@no-doc
  const FDActionSheetHeader({
    required this.title,
    this.displayClose = true,
    this.icon,
    this.subtitle,
    this.onClose,
    super.key,
  });

  ///@no-doc
  final Widget? icon;

  ///@no-doc
  final String title;

  ///@no-doc
  final String? subtitle;

  ///@no-doc
  final bool displayClose;

  ///@no-doc
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return _Layout(
      icon: icon,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      closeAction: displayClose
          ? FDIconButton.tonal(
              size: FDButtonSize.xs,
              icon: FDIcons.x.toIcon(
                size: FlowinDesignIconSize.xs,
              ),
              onPressed: () => onClose?.call(),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout({
    required this.title,
    required this.closeAction,
    this.icon,
    this.subtitle,
  });

  final Widget? icon;
  final Widget title;
  final Widget? subtitle;
  final Widget closeAction;

  @override
  Widget build(BuildContext context) {
    return FDCard(
      cornerRadius: FlowinDesignRadius.radius1000,
      padding: const EdgeInsets.all(FlowinDesignSpace.space600),
      child: Stack(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon ?? const SizedBox.shrink(),
                title,
                subtitle ?? const SizedBox.shrink(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: closeAction,
          ),
        ],
      ),
    );
  }
}
