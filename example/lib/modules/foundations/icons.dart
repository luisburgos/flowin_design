import 'package:example/shared/workbench/presentation/widgets/widgets.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FoundationsIconsShowcase extends StatelessWidget {
  /// @no-doc
  const FoundationsIconsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: FDChipGroupViewPager(
        items: FDIcons.values.map((icon) {
          return FDChipGroupViewPage(
            label: icon.name.toUpperCase(),
            builder: (_) => _StoriesForIcon(icon),
          );
        }).toList(),
      ),
    );
  }
}

class _StoriesForIcon extends StatelessWidget {
  const _StoriesForIcon(this.icon);

  final FDIcons icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: FlowinDesignSpace.space400,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: FlowinDesignIconSize.values.reversed.map((size) {
        return FDIcon(icon: icon, size: size);
      }).toList(),
    );
  }
}
