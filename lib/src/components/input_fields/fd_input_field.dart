import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class FDInputField extends StatelessWidget {
  /// @no-doc
  const FDInputField({
    required this.label,
    required this.child,
    this.labelDecoration,
    super.key,
  });

  /// @no-doc
  final String label;

  /// @no-doc
  final Widget child;

  /// @no-doc
  final FDInputFieldLabelDecoration? labelDecoration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final borderColor = colorScheme.outlineVariant;
    final labelTextStyle = textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface,
    );

    final effectiveLabelDecoration = FDInputFieldLabelDecoration(
      textAlign: labelDecoration?.textAlign ?? TextAlign.center,
      width: labelDecoration?.width ?? fdInputFieldLabelWidth,
    );

    return FDCard(
      borderRadius: const FDCardBorderRadius.all(
        FlowinDesignRadius.radius400,
      ),
      size: const Size.fromHeight(fdInputFieldMinHeight),
      backgroundColor: Colors.transparent,
      borderSide: BorderSide(color: borderColor),
      padding: const EdgeInsets.symmetric(
        vertical: FlowinDesignSpace.space300,
        horizontal: FlowinDesignSpace.space400,
      ),
      child: SizedBox(
        height: fdInputFieldContentMaxHeight,
        child: Row(
          spacing: FlowinDesignSpace.space250,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: effectiveLabelDecoration.width,
              child: Text(
                label,
                textAlign: effectiveLabelDecoration.textAlign,
                style: labelTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            FDVerticalDivider(color: borderColor),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

/// @no-doc
class FDInputFieldLabelDecoration {
  /// @no-doc
  const FDInputFieldLabelDecoration({
    required this.textAlign,
    required this.width,
  });

  /// @no-doc
  final TextAlign? textAlign;

  /// @no-doc
  final double? width;

  /// @no-doc
  FDInputFieldLabelDecoration copyWith({
    TextAlign? textAlign,
    double? width,
  }) {
    return FDInputFieldLabelDecoration(
      textAlign: textAlign,
      width: width,
    );
  }
}
