import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
const double fdDefaultAppBarHeight =
    fdDefaultAppBarPadding + fdDefaultAppBarActionSize;

/// @no-doc
const double fdDefaultAppBarActionSize = FlowinDesignSpace.space1200;

/// @no-doc
const double fdDefaultAppBarPadding = FlowinDesignSpace.space200;

/// @no-doc
class FDAppBar extends StatelessWidget {
  /// @no-doc
  const FDAppBar({
    required this.leading,
    required this.trailing,
    this.child,
    super.key,
  });

  /// @no-doc
  final Widget? leading;

  /// @no-doc
  final Widget? trailing;

  /// @no-doc
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: fdDefaultAppBarPadding,
        right: fdDefaultAppBarPadding,
        top: fdDefaultAppBarPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ColoredBox(
                color: Colors.transparent,
                child: leading ?? const _NoActionPlaceholder(),
              ),
              child ?? const Spacer(),
              ColoredBox(
                color: Colors.transparent,
                child: trailing ?? const _NoActionPlaceholder(),
              ),
            ],
          ),
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
      dimension: fdDefaultAppBarActionSize,
    );
  }
}
