import 'package:flowin_design/src/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @no-doc
class FDTextField extends StatelessWidget {
  /// @no-doc
  const FDTextField({
    required this.id,
    required this.label,
    this.initialValue,
    this.onChanged,
    this.autofocus = false,
    this.hintText,
    this.inputFormatters,
    this.maxLines = fdTextFieldMaxLines,
    this.labelDecoration,
    super.key,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String label;

  /// @no-doc
  final String? initialValue;

  /// @no-doc
  final void Function(String)? onChanged;

  /// @no-doc
  final bool autofocus;

  /// @no-doc
  final String? hintText;

  /// @no-doc
  final int maxLines;

  /// @no-doc
  final FDInputFieldLabelDecoration? labelDecoration;

  /// @no-doc
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final hintTextStyle = textTheme.bodyLarge?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    return FDInputField(
      key: Key('fd-text-field-$id'),
      label: label,
      labelDecoration: labelDecoration,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        autofocus: autofocus,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: hintTextStyle,
          fillColor: Colors.blueAccent.shade100,
        ),
      ),
    );
  }
}
