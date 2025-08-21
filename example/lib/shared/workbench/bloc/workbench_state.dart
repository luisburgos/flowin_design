part of 'workbench_bloc.dart';

/// @no-doc
class WorkbenchState extends Equatable {
  /// @no-doc
  const WorkbenchState({
    this.visiblePanes = const {WorkbenchPane.left},
    this.sidebarItem = WorkbenchSideBarItem.components,
    this.selectedFoundationsOption,
    this.selectedComponentsOption,
  });

  /// @no-doc
  factory WorkbenchState.fromQuery(WorkbenchQuery query) => WorkbenchState(
    visiblePanes: {
      ...?query.visiblePanes?.map(WorkbenchPane.fromId),
    }.cast<WorkbenchPane>(),
    sidebarItem:
        WorkbenchSideBarItem.fromId(query.sideBar) ??
        WorkbenchSideBarItem.components,
    selectedFoundationsOption: FoundationsPaneOption.fromId(
      query.foundationsOption,
    ),
    selectedComponentsOption: ComponentsPaneOption.fromId(
      query.componentsOption,
    ),
  );

  /// @no-doc
  final Set<WorkbenchPane> visiblePanes;

  /// @no-doc
  final WorkbenchSideBarItem? sidebarItem;

  /// @no-doc
  final FoundationsPaneOption? selectedFoundationsOption;

  /// @no-doc
  final ComponentsPaneOption? selectedComponentsOption;

  /// @no-doc
  WorkbenchState copyWith({
    Set<WorkbenchPane>? visiblePanes,
    WorkbenchSideBarItem? sidebarItem,
    FoundationsPaneOption? Function()? selectedFoundationsOption,
    ComponentsPaneOption? Function()? selectedComponentsOption,
  }) => WorkbenchState(
    sidebarItem: sidebarItem ?? this.sidebarItem,
    visiblePanes: visiblePanes ?? this.visiblePanes,
    selectedFoundationsOption: selectedFoundationsOption != null
        ? selectedFoundationsOption()
        : this.selectedFoundationsOption,
    selectedComponentsOption: selectedComponentsOption != null
        ? selectedComponentsOption()
        : this.selectedComponentsOption,
  );

  /// @no-doc
  WorkbenchQuery toQuery() => WorkbenchQuery(
    sideBar: sidebarItem?.id,
    visiblePanes: visiblePanes.map((pane) => pane.id).toList(),
    foundationsOption: selectedFoundationsOption?.id,
    componentsOption: selectedComponentsOption?.id,
  );

  @override
  List<Object?> get props => [
    sidebarItem,
    visiblePanes,
    selectedFoundationsOption,
    selectedComponentsOption,
  ];

  @override
  String toString() {
    return '''
    WorkbenchState {
      visiblePanes: $visiblePanes,
      sidebarItem: $sidebarItem,
      selectedFoundationsOption: $selectedFoundationsOption,
      selectedComponentsOption: $selectedComponentsOption,
    }''';
  }
}
