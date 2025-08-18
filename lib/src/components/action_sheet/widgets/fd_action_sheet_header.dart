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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return _Layout(
      icon: icon,
      title: Text(
        title,
        style: textTheme.headlineSmall,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            )
          : null,
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
    final hasIcon = icon != null;
    return ColoredBox(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(
            trailing: closeAction,
            child: hasIcon ? icon! : title,
          ),
          if (hasIcon)
            _Subheader(
              children: [
                if (hasIcon) title,
                if (subtitle != null) subtitle!,
              ],
            ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.child,
    this.trailing,
  });

  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        left: FlowinDesignSpace.space200,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _Subheader extends StatelessWidget {
  const _Subheader({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        left: FlowinDesignSpace.space200,
        right: FlowinDesignSpace.space200,
        top: FlowinDesignSpace.space200,
      ),
      child: ColoredBox(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: FlowinDesignSpace.space200,
          children: children,
        ),
      ),
    );
  }
}
