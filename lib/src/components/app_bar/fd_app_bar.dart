import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
const double fdDefaultAppBarHeight =
    fdDefaultAppBarPadding + fdDefaultAppBarContentHeight;

/// @no-doc
const double fdDefaultAppBarContentHeight = FlowinDesignSpace.space1200;

/// @no-doc
const double fdDefaultAppBarPadding = FlowinDesignSpace.space200;

/// @no-doc
class FDAppBar extends StatelessWidget {
  /// @no-doc
  const FDAppBar({
    this.leading,
    this.trailing,
    this.child,
    this.footer,
    super.key,
  });

  /// @no-doc
  final Widget? leading;

  /// @no-doc
  final Widget? trailing;

  /// @no-doc
  final Widget? child;

  /// @no-doc
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: fdDefaultAppBarHeight,
      ),
      padding: const EdgeInsets.only(
        left: fdDefaultAppBarPadding,
        right: fdDefaultAppBarPadding,
        top: fdDefaultAppBarPadding,
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: fdDefaultAppBarContentHeight,
            ),
            child: Row(
              children: [
                ColoredBox(
                  color: Colors.transparent,
                  child: leading != null
                      ? Container(
                          constraints: const BoxConstraints(
                            minHeight: fdDefaultAppBarContentHeight,
                            minWidth: fdDefaultAppBarContentHeight,
                          ),
                          height: fdDefaultAppBarContentHeight,
                          padding: const EdgeInsets.symmetric(
                            vertical: FlowinDesignSpace.space100,
                          ),
                          child: leading,
                        )
                      : const _NoActionPlaceholder(),
                ),
                if (child != null) Expanded(child: child!) else const Spacer(),
                ColoredBox(
                  color: Colors.transparent,
                  child: trailing != null
                      ? Container(
                          constraints: const BoxConstraints(
                            minHeight: fdDefaultAppBarContentHeight,
                            minWidth: fdDefaultAppBarContentHeight,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: FlowinDesignSpace.space100,
                          ),
                          child: trailing,
                        )
                      : const _NoActionPlaceholder(),
                ),
              ],
            ),
          ),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}

class _NoActionPlaceholder extends StatelessWidget {
  const _NoActionPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: fdDefaultAppBarContentHeight,
    );
  }
}
