import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:ios_color_picker/show_ios_color_picker.dart';

/// @no-doc
class FDColorPickerField extends StatefulWidget {
  /// @no-doc
  const FDColorPickerField({
    required this.id,
    required this.predefinedColors,
    this.selectedColor,
    super.key,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final Color? selectedColor;

  /// @no-doc
  final List<Color> predefinedColors;

  @override
  State<FDColorPickerField> createState() => _FDColorPickerFieldState();
}

class _FDColorPickerFieldState extends State<FDColorPickerField> {
  IOSColorPickerController iosColorPickerController =
      IOSColorPickerController();

  @override
  void dispose() {
    iosColorPickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      if (widget.selectedColor != null) widget.selectedColor!,
      ...widget.predefinedColors,
    ];
    return FDInputField(
      label: 'Color',
      child: SizedBox(
        height: FlowinDesignSpace.space1000,
        child: FDInlineColorPicker(
          key: Key('fd-color-picker-field-${widget.id}'),
          colors: colors,
          selectedColor: widget.selectedColor,
          onCustomColorTap: () {
            //_handleCustomColorTap(selectedColor)
          },
          onPredefinedColorTap: (color) {
            //widget.onColorChanged(color);
          },
        ),
      ),
    );
  }
}

/// @no-doc
class FDInlineColorPicker extends StatelessWidget {
  /// @no-doc
  const FDInlineColorPicker({
    required this.colors,
    required this.onCustomColorTap,
    required this.onPredefinedColorTap,
    this.selectedColor,
    super.key,
  });

  /// @no-doc
  final Color? selectedColor;

  /// @no-doc
  final List<Color> colors;

  /// @no-doc
  final void Function() onCustomColorTap;

  /// @no-doc
  final void Function(Color) onPredefinedColorTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      separatorBuilder: (_, _) => const SizedBox(
        width: FlowinDesignSpace.space400,
      ),
      itemBuilder: (context, index) {
        final color = colors[index];
        final isSelected = selectedColor == color;
        const size = FlowinDesignSpace.space700;
        final isFirst = index == 0;

        return GestureDetector(
          onTap: () {
            if (isFirst) {
              onCustomColorTap();
            } else {
              onPredefinedColorTap(color);
            }
          },
          child: isFirst
              ? FDGradientCircle(color: color, size: size)
              : FDColorCircle(
                  color: color,
                  borderColor: Theme.of(context).colorScheme.primary,
                  size: size,
                  isSelected: isSelected,
                ),
        );
      },
    );
  }
}
