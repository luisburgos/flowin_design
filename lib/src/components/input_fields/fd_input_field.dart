import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDInputField extends StatelessWidget {
  /// @no-doc
  const FDInputField({
    required this.label,
    required this.child,
    super.key,
  });

  /// @no-doc
  final String label;

  /// @no-doc
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final borderColor = colorScheme.outlineVariant;
    final labelTextStyle = textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface,
    );
    const minHeight = FlowinDesignSpace.space1000;

    return FDCard(
      cornerRadius: FlowinDesignRadius.radius400,
      backgroundColor: Colors.transparent,
      borderSide: BorderSide(color: borderColor),
      padding: const EdgeInsets.symmetric(
        vertical: FlowinDesignSpace.space300,
        horizontal: FlowinDesignSpace.space400,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: minHeight),
        child: Row(
          spacing: FlowinDesignSpace.space250,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: labelTextStyle),
            SizedBox(
              height: minHeight,
              child: FDVerticalDivider(color: borderColor),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
