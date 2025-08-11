import 'package:example/modules/foundations/widgets/color_scheme_mapper.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ColorGridSelector extends StatelessWidget {
  /// @no-doc
  const ColorGridSelector({
    required this.lightSeed,
    required this.darkSeed,
    super.key,
  });

  /// @no-doc
  final Color lightSeed;

  /// @no-doc
  final Color darkSeed;

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
        return Column(
          children: [
            ColorGridView(
              title: 'Light Theme',
              tokenColors: lightTokens,
              crossAxisCount: crossAxisCount,
            ),
            const SizedBox(height: 20),
            ColorGridView(
              title: 'Dark Theme',
              tokenColors: darkTokens,
              crossAxisCount: crossAxisCount,
            ),
          ],
        );
      },
    );
  }
}

/// @no-doc
class ColorGridView extends StatelessWidget {
  /// @no-doc
  const ColorGridView({
    required this.title,
    required this.crossAxisCount,
    required this.tokenColors,
    super.key,
  });

  /// @no-doc
  final String title;

  /// @no-doc
  final int crossAxisCount;

  /// @no-doc
  final Map<String, Color> tokenColors;

  @override
  Widget build(BuildContext context) {
    final items = tokenColors.entries.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2.5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final label = items[index].key;
            final color = items[index].value;
            final textColor =
                ThemeData.estimateBrightnessForColor(color) == Brightness.dark
                ? Colors.white
                : Colors.black;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: color,
                child: Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
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
