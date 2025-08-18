import 'package:flutter/material.dart';

/// @no-doc
extension PopDefaultActionSheet on BuildContext {
  /// @no-doc
  void popDefaultActionSheet() {
    Navigator.of(this).pop();
  }
}

/// @no-doc
Future<T?> showDefaultActionSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  BoxConstraints? constraints,
  BorderRadius? borderRadius,
  Color? backgroundColor,
  Clip? clipBehavior,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: backgroundColor ?? Colors.transparent,
    isScrollControlled: isScrollControlled,
    constraints: constraints ?? const BoxConstraints(minWidth: double.infinity),
    clipBehavior: clipBehavior ?? Clip.none,
    builder: builder,
  );
}
