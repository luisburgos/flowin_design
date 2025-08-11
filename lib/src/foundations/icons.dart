import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// @no-doc
mixin FDIcon {
  /// @no-doc
  String stringForSize(FlowinDesignIconSize size);
}

/// @no-doc
class FDIconSplit implements FDIcon {
  /// @no-doc
  const FDIconSplit();

  @override
  String stringForSize(FlowinDesignIconSize size) {
    switch (size) {
      case FlowinDesignIconSize.xs:
        return _xs;
      case FlowinDesignIconSize.sm:
        return _sm;
      case FlowinDesignIconSize.md:
        return _sm;
      case FlowinDesignIconSize.lg:
        return _sm;
      case FlowinDesignIconSize.xl:
        return _sm;
      case FlowinDesignIconSize.xxl:
        return _sm;
    }
  }

  static const _xs = '''
  <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M1.5 6H10.5M2.5 1.5H9.5C10.0523 1.5 10.5 1.94772 10.5 2.5V9.5C10.5 10.0523 10.0523 10.5 9.5 10.5H2.5C1.94772 10.5 1.5 10.0523 1.5 9.5V2.5C1.5 1.94772 1.94772 1.5 2.5 1.5Z" stroke="#181818" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"/>
  </svg>
  ''';

  static const _sm = '''
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M1 7H13M2.33333 1H11.6667C12.403 1 13 1.59695 13 2.33333V11.6667C13 12.403 12.403 13 11.6667 13H2.33333C1.59695 13 1 12.403 1 11.6667V2.33333C1 1.59695 1.59695 1 2.33333 1Z" stroke="#181818" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
  </svg>
  ''';
}

/// @no-doc
class FDIcons {
  /// @no-doc
  const FDIcons();

  /// @no-doc
  FDSvgIcon get split => FDSvgIcon(
    const FDIconSplit().stringForSize(FlowinDesignIconSize.sm),
  );
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
