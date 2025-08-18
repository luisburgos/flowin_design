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
  BorderRadius? borderRadius,
  Color? backgroundColor,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: backgroundColor ?? Colors.transparent,
    isScrollControlled: isScrollControlled,
    constraints: const BoxConstraints(minWidth: double.infinity),
    clipBehavior: Clip.none,
    builder: builder,
  );
}
