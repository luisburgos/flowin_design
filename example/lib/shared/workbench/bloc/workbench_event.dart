part of 'workbench_bloc.dart';

/// @no-doc
sealed class WorkbenchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// @no-doc
class TogglePane extends WorkbenchEvent {
  /// @no-doc
  TogglePane(this.pane);

  /// @no-doc
  final WorkbenchPane pane;
}

/// @no-doc
class OpenPane extends WorkbenchEvent {
  /// @no-doc
  OpenPane(this.pane);

  /// @no-doc
  final WorkbenchPane pane;
}

/// @no-doc
class MinimizePane extends WorkbenchEvent {
  /// @no-doc
  MinimizePane(this.pane);

  /// @no-doc
  final WorkbenchPane pane;
}

/// @no-doc
class SetSidebarItem extends WorkbenchEvent {
  /// @no-doc
  SetSidebarItem(this.item);

  /// @no-doc
  final WorkbenchSideBarItem item;
}

/// @no-doc
class SetFoundationsPaneOption extends WorkbenchEvent {
  /// @no-doc
  SetFoundationsPaneOption({
    required this.item,
    this.pane,
  });

  /// @no-doc
  final WorkbenchSideBarItem? pane;

  /// @no-doc
  final FoundationsPaneOption item;
}

/// @no-doc
class SetComponentsPaneOption extends WorkbenchEvent {
  /// @no-doc
  SetComponentsPaneOption({
    this.option,
  });

  /// @no-doc
  final ComponentsPaneOption? option;
}
