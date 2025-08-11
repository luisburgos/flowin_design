import 'package:example/shared/workbench/constants.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ExpandablePane extends StatefulWidget {
  /// @no-doc
  const ExpandablePane({
    required this.icon,
    required this.child,
    required this.height,
    required this.expandedWidth,
    required this.isExpanded,
    required this.onOpenPressed,
    required this.onMinimizePressed,
    this.name,
    this.leftDivider,
    this.rightDivider,
    this.collapsedContent,
    this.collapsedWidth,
    this.closeIcon,
    super.key,
  });

  /// @no-doc
  final String? name;

  /// @no-doc
  final bool isExpanded;

  /// @no-doc
  final Icon icon;

  /// @no-doc
  final Widget child;

  /// @no-doc
  final Widget? leftDivider;

  /// @no-doc
  final Widget? rightDivider;

  /// @no-doc
  final Widget? collapsedContent;

  /// @no-doc
  final IconData? closeIcon;

  /// @no-doc
  final double height;

  /// @no-doc
  final double expandedWidth;

  /// @no-doc
  final double? collapsedWidth;

  /// @no-doc
  final VoidCallback onOpenPressed;

  /// @no-doc
  final VoidCallback onMinimizePressed;

  @override
  State<ExpandablePane> createState() => _ExpandablePaneState();
}

/// AnimatedSize takes care of the tween automatically.
/// No manual AnimationController is required unless you want to drive
/// more effects with the same value.
class _ExpandablePaneState extends State<ExpandablePane>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // Build the actual pane content for current state.
    final paneBody = widget.isExpanded
        ? _ExpandedContent(
            name: widget.name,
            onMinimize: widget.onMinimizePressed,
            closeIcon: widget.closeIcon ?? Icons.close,
            child: widget.child,
          )
        : widget.collapsedContent ??
              _CollapsedContent(
                icon: widget.icon,
                height: MediaQuery.of(context).size.height,
                onOpen: widget.onOpenPressed,
              );

    // Row with optional dividers.
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.leftDivider != null)
          SizedBox(
            width: wbDividerThickness,
            child:
                widget.leftDivider ??
                const VerticalDivider(
                  width: wbDividerThickness,
                  thickness: wbDividerThickness,
                ),
          ),
        // The pane itself flexes to whatever width AnimatedSize gives.
        Flexible(child: paneBody),
        if (widget.rightDivider != null)
          SizedBox(
            width: wbDividerThickness,
            child:
                widget.rightDivider ??
                const VerticalDivider(
                  width: wbDividerThickness,
                  thickness: wbDividerThickness,
                ),
          ),
      ],
    );

    // Wrap with a fixed height box, then ClipRect → AnimatedSize.
    return SizedBox(
      height: widget.height,
      child: ClipRect(
        child: AnimatedSize(
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 150),
          curve: Curves.ease,
          // AnimatedSize measures the `row`, then animates *itself* from
          // the previous size to the new size – parent & child widths are
          // identical on every frame, so no overflow is ever painted.
          child: SizedBox(
            width: widget.isExpanded
                ? widget.expandedWidth
                : widget.collapsedWidth ?? wbDefaultCollapsedPaneWidth,
            child: row,
          ),
        ),
      ),
    );
  }
}

class _CollapsedContent extends StatelessWidget {
  const _CollapsedContent({
    required this.icon,
    required this.height,
    required this.onOpen,
  });

  final Icon icon;
  final double height;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onOpen,
      icon: icon,
      style: wbSmallButtonStyle.copyWith(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        ),
        fixedSize: WidgetStatePropertyAll(Size.fromHeight(height)),
        shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
      ),
      alignment: Alignment.topCenter,
    );
  }
}

class _ExpandedContent extends StatelessWidget {
  const _ExpandedContent({
    required this.child,
    required this.onMinimize,
    required this.closeIcon,
    this.name,
  });

  final String? name;
  final Widget child;
  final VoidCallback onMinimize;
  final IconData closeIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (name != null)
                Expanded(
                  child: Text(
                    name!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              IconButton(
                onPressed: onMinimize,
                icon: Icon(closeIcon),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                style: wbSmallButtonStyle,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(child: child),
      ],
    );
  }
}
