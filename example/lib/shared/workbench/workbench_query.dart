/// @no-doc
class WorkbenchQuery {
  /// @no-doc
  const WorkbenchQuery({
    required this.sideBar,
    this.visiblePanes,
    this.foundationsOption,
    this.componentsOption,
  });

  /// @no-doc
  factory WorkbenchQuery.fromUri(Uri uri) {
    return WorkbenchQuery(
      sideBar: uri.queryParameters['sideBar'],
      visiblePanes: uri.queryParameters['visiblePanes']?.split(','),
      foundationsOption: uri.queryParameters['foundationsOption'],
      componentsOption: uri.queryParameters['componentsOption'],
    );
  }

  /// @no-doc
  final String? sideBar;

  /// @no-doc
  final List<String>? visiblePanes;

  /// @no-doc
  final String? foundationsOption;

  /// @no-doc
  final String? componentsOption;

  /// @no-doc
  Map<String, dynamic> toMap() {
    return {
      if (sideBar != null) 'sideBar': sideBar,
      if (visiblePanes != null && visiblePanes!.isNotEmpty)
        'visiblePanes': visiblePanes!.join(','),
      if (foundationsOption != null) 'foundationsOption': foundationsOption,
      if (componentsOption != null) 'componentsOption': componentsOption,
    };
  }

  /// @no-doc
  Uri toUri(String path) {
    return Uri(path: path, queryParameters: toMap());
  }

  @override
  String toString() {
    return '''
    WorkbenchQuery(
      sideBar: $sideBar,
      visiblePanes: $visiblePanes,
      foundationsOption: $foundationsOption,
      componentsOption: $componentsOption,
    )
    ''';
  }
}
