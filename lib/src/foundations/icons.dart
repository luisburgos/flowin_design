import 'package:flowin_design/src/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class FDIcon extends StatelessWidget {
  /// @no-doc
  const FDIcon({
    required this.icon,
    this.size = FlowinDesignIconSize.md,
    super.key,
  });

  /// @no-doc
  final FDIcons icon;

  /// @no-doc
  final FlowinDesignIconSize? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon.iconData,
      size: size?.value,
      weight: size?.stroke,
    );
  }
}

/// @no-doc
enum FDIcons {
  /// @no-doc
  board,

  /// @no-doc
  timeline,

  /// @no-doc
  edit,

  /// @no-doc
  paint,

  /// @no-doc
  trash,

  /// @no-doc
  share,

  /// @no-doc
  plus,

  /// @no-doc
  timer,

  /// @no-doc
  arrowRightLeft,

  /// @no-doc
  arrowDownUp,

  /// @no-doc
  settings,

  /// @no-doc
  more,

  /// @no-doc
  x,

  /// @no-doc
  setNeutral,

  /// @no-doc
  scanFace,

  /// @no-doc
  restart,

  /// @no-doc
  back,

  /// @no-doc
  done,

  /// @no-doc
  spark;

  /// @no-doc
  IconData get iconData => switch (this) {
    FDIcons.board => LucideIcons.rows2,
    FDIcons.timeline => LucideIcons.route,
    FDIcons.edit => LucideIcons.settings2,
    FDIcons.paint => LucideIcons.palette,
    FDIcons.trash => LucideIcons.trash,
    FDIcons.share => LucideIcons.share,
    FDIcons.plus => LucideIcons.plus,
    FDIcons.timer => LucideIcons.timer,
    FDIcons.arrowRightLeft => LucideIcons.arrowRightLeft,
    FDIcons.arrowDownUp => LucideIcons.arrowDownUp,
    FDIcons.settings => LucideIcons.settings,
    FDIcons.more => LucideIcons.ellipsisVertical,
    FDIcons.x => LucideIcons.x,
    FDIcons.setNeutral => LucideIcons.circleDashed,
    FDIcons.scanFace => LucideIcons.scanFace,
    FDIcons.restart => LucideIcons.rotateCcw,
    FDIcons.back => LucideIcons.arrowLeft,
    FDIcons.done => LucideIcons.circleCheck,
    FDIcons.spark => LucideIcons.sparkles,
  };
}
