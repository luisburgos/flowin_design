import 'package:example/modules/foundations/widgets/color_scheme_grid_view.dart';
import 'package:example/modules/foundations/widgets/color_scheme_mapper.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FoundationsColorsShowcase extends StatelessWidget {
  /// @no-doc
  const FoundationsColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final mapper = ColorSchemeMapper(
      light: FlowinDesignSchemes.light,
      dark: FlowinDesignSchemes.dark,
    );

    final lightTokens = mapper.asMap(Brightness.light);
    final darkTokens = mapper.asMap(Brightness.dark);

    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final crossAxisCount = _getCrossAxisCount(parentWidth);
        Logger.instance.info(
          'Getting cross axis count is $crossAxisCount for width $parentWidth',
        );
        return ShowcaseCard(
          child: FDChipGroupViewPager(
            items: [
              FDChipGroupViewPage(
                label: 'Light',
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(FlowinDesignSpace.space600),
                  child: ColorSchemeGridView(
                    title: 'Light Theme',
                    tokenColors: lightTokens,
                    crossAxisCount: crossAxisCount,
                  ),
                ),
              ),
              FDChipGroupViewPage(
                label: 'Dark',
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(FlowinDesignSpace.space600),
                  child: ColorSchemeGridView(
                    title: 'Dark Theme',
                    tokenColors: darkTokens,
                    crossAxisCount: crossAxisCount,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

int _getCrossAxisCount(double width) {
  if (width > 900) {
    return 6;
  } else {
    return 4;
  }
}
