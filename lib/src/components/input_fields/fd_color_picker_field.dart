import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:ios_color_picker/show_ios_color_picker.dart';

/// @no-doc
class FDColorPickerField extends StatefulWidget {
  /// @no-doc
  const FDColorPickerField({
    required this.id,
    required this.predefinedColors,
    this.initialColor,
    this.onColorChanged,
    super.key,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final Color? initialColor;

  /// @no-doc
  final List<Color> predefinedColors;

  /// @no-doc
  final void Function(Color)? onColorChanged;

  @override
  State<FDColorPickerField> createState() => _FDColorPickerFieldState();
}

class _FDColorPickerFieldState extends State<FDColorPickerField> {
  final _iosColorPickerController = IOSColorPickerController();

  Color? _selectedColor;

  @override
  void initState() {
    _selectedColor = widget.initialColor;
    super.initState();
  }

  @override
  void dispose() {
    _iosColorPickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FDInputField(
      key: Key('fd-color-picker-field-${widget.id}'),
      label: 'Color',
      child: FDInlineColorPicker(
        selectedColor: _selectedColor,
        predefinedColors: widget.predefinedColors,
        onCustomColorTap: () {
          _handleCustomColorTap(_selectedColor);
        },
        onPredefinedColorTap: _setSelectedColor,
      ),
    );
  }

  void _handleCustomColorTap(Color? selectedColor) {
    _iosColorPickerController.showIOSCustomColorPicker(
      startingColor: selectedColor,
      onColorChanged: _setSelectedColor,
      context: context,
    );
  }

  void _setSelectedColor(Color color) {
    if (!mounted) return;
    setState(() {
      _selectedColor = color;
      widget.onColorChanged?.call(color);
    });
  }
}

/// @no-doc
class FDInlineColorPicker extends StatelessWidget {
  /// @no-doc
  const FDInlineColorPicker({
    required this.predefinedColors,
    required this.onCustomColorTap,
    required this.onPredefinedColorTap,
    this.selectedColor,
    super.key,
  });

  /// @no-doc
  final Color? selectedColor;

  /// @no-doc
  final List<Color> predefinedColors;

  /// @no-doc
  final void Function() onCustomColorTap;

  /// @no-doc
  final void Function(Color) onPredefinedColorTap;

  @override
  Widget build(BuildContext context) {
    final gapColor = Theme.of(context).colorScheme.surface;
    final isSelectedFromPredefined = predefinedColors.contains(selectedColor);
    final isGradientSelected =
        selectedColor != null && !isSelectedFromPredefined;

    return SizedBox(
      height: FlowinDesignSpace.space1000,
      child: Row(
        spacing: FlowinDesignSpace.space400,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              key: const ValueKey('fd-color-picker-gradient'),
              onTap: onCustomColorTap,
              child: Tooltip(
                message: isGradientSelected
                    ? 'Custom color selected'
                    : 'Pick a custom color',
                child: FDColorRadialButton.gradient(
                  selected: isGradientSelected,
                  gapColor: gapColor,
                  color: selectedColor ?? Colors.transparent,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: predefinedColors.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: FlowinDesignSpace.space400);
              },
              itemBuilder: (context, index) {
                final predefinedColor = predefinedColors[index];

                return GestureDetector(
                  onTap: () => onPredefinedColorTap(predefinedColor),
                  child: FDColorRadialButton(
                    selected: selectedColor == predefinedColor,
                    color: predefinedColor,
                    gapColor: gapColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
