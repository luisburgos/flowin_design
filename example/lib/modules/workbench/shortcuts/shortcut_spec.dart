import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// @no-doc
class ShortcutSpec {
  /// @no-doc
  const ShortcutSpec({
    required this.modifiers,
    required this.key,
    required this.intent,
  });

  /// Modifier keys (Alt / Meta / Shift …).  Pass an empty list for “none”.
  final List<LogicalKeyboardKey> modifiers;

  /// The main key (digit2, keyF, arrowLeft …).
  final LogicalKeyboardKey key;

  /// The `Intent` that should fire when this combo is pressed.
  final Intent intent;

  /// Converts the spec into the map entry used by `Shortcuts`.
  MapEntry<LogicalKeySet, Intent> toEntry() => MapEntry(
        LogicalKeySet.fromSet({...modifiers, key}),
        intent,
      );
}
