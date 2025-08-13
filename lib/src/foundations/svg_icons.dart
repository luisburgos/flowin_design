import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// @no-doc
class FDSvgIcons {
  /// @no-doc
  const FDSvgIcons();

  // TODO(luis): add svg icons contents
}

/// @no-doc
class FDSvgIcon extends StatelessWidget {
  /// @no-doc
  const FDSvgIcon(
    this.icon, {
    super.key,
    this.color,
    this.size = 24,
    this.alignment = Alignment.center,
  });

  /// @no-doc
  final String icon;

  /// @no-doc
  final Color? color;

  /// @no-doc
  final double? size;

  /// @no-doc
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      width: size,
      height: size,
      alignment: alignment,
    );
  }
}
