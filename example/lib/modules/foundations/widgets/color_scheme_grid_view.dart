import 'package:flutter/material.dart';

/// @no-doc
class ColorSchemeGridView extends StatelessWidget {
  /// @no-doc
  const ColorSchemeGridView({
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
