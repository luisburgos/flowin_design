import 'package:flowin_design/src/components/input_fields/fd_input_field.dart';
import 'package:flutter/material.dart';

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
      child: TextFormField(
        autofocus: autofocus,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: hintTextStyle,
        ),
        onChanged: onChanged,
        initialValue: initialValue,
      ),
    );
  }
}
