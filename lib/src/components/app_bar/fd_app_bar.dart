import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
const double fdDefaultAppBarHeight = FlowinDesignSpace.space1400;

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
      color: Colors.transparent,
      constraints: const BoxConstraints(
        maxHeight: fdDefaultAppBarHeight,
      ),
      child: Stack(
        children: [
          if (footer != null)
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: footer!,
            ),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(
              top: fdDefaultAppBarPadding,
              left: fdDefaultAppBarPadding,
              right: fdDefaultAppBarPadding,
            ),
            child: Row(
              children: [
                ColoredBox(
                  color: Colors.transparent,
                  child: leading != null
                      ? _AppBarSquareContainer(
                          child: leading,
                        )
                      : const _AppBarSquareContainer(),
                ),
                if (child != null)
                  Expanded(
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: child,
                    ),
                  )
                else
                  const Spacer(),
                ColoredBox(
                  color: Colors.transparent,
                  child: trailing != null
                      ? _AppBarSquareContainer(
                          child: trailing,
                        )
                      : const _AppBarSquareContainer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarSquareContainer extends StatelessWidget {
  const _AppBarSquareContainer({
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: fdDefaultAppBarContentHeight,
        minWidth: fdDefaultAppBarContentHeight,
      ),
      child: child,
    );
  }
}
