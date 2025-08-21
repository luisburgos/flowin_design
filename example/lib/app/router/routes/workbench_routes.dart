part of 'routes.dart';

/// @no-doc
class WorkbenchRoutes {
  /// @no-doc
  static const String rootRouteName = 'workbench';

  /// @no-doc
  static const String rootRouteLocation = '/workbench';

  /// @no-doc
  static List<GoRoute> routes() => [
    GoRoute(
      name: rootRouteName,
      path: rootRouteLocation,
      builder: (context, state) {
        final query = WorkbenchQuery.fromUri(state.uri);
        Logger.instance.info('query: $query');
        return WorkbenchPage(query: query);
      },
    ),
  ];
}
