/// @no-doc
enum WorkbenchPane {
  /// @no-doc
  sideBar,

  /// @no-doc
  left,

  /// @no-doc
  right,

  /// @no-doc
  rightExtra;

  /// @no-doc
  String get id {
    switch (this) {
      case WorkbenchPane.left:
        return 'left';
      case WorkbenchPane.right:
        return 'right';
      case WorkbenchPane.rightExtra:
        return 'rightExtra';
      case WorkbenchPane.sideBar:
        return 'sideBar';
    }
  }

  /// @no-doc
  static WorkbenchPane fromId(String id) {
    switch (id) {
      case 'left':
        return WorkbenchPane.left;
      case 'right':
        return WorkbenchPane.right;
      case 'rightExtra':
        return WorkbenchPane.rightExtra;
      case 'sideBar':
        return WorkbenchPane.sideBar;
      default:
        throw Exception('Invalid WorkbenchPane id: $id');
    }
  }
}

/// @no-doc
enum WorkbenchSideBarItem {
  /// @no-doc
  components,

  /// @no-doc
  foundations,

  /// @no-doc
  settings;

  /// @no-doc
  String get id {
    switch (this) {
      case WorkbenchSideBarItem.components:
        return 'components';
      case WorkbenchSideBarItem.foundations:
        return 'foundations';
      case WorkbenchSideBarItem.settings:
        return 'settings';
    }
  }

  /// @no-doc
  bool get isComponents => this == WorkbenchSideBarItem.components;

  /// @no-doc
  bool get isFoundations => this == WorkbenchSideBarItem.foundations;

  /// @no-doc
  bool get isSettings => this == WorkbenchSideBarItem.settings;

  /// @no-doc
  static WorkbenchSideBarItem? fromId(String? id) {
    if (id == null) return null;
    if (id == 'components') return WorkbenchSideBarItem.components;
    if (id == 'foundations') return WorkbenchSideBarItem.foundations;
    if (id == 'settings') return WorkbenchSideBarItem.settings;
    throw Exception('Invalid WorkbenchSideBarItem id: $id');
  }

  /// @no-doc
  String get label {
    switch (this) {
      case WorkbenchSideBarItem.components:
        return 'Components';
      case WorkbenchSideBarItem.foundations:
        return 'Foundations';
      case WorkbenchSideBarItem.settings:
        return 'Settings';
    }
  }
}
