import 'package:example/modules/workbench/pages/workbench_page.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/workbench_query.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'workbench_routes.dart';

/// @no-doc
const String appInitialLocation = WorkbenchRoutes.rootRouteLocation;

/// @no-doc
List<GoRoute> appRoutes() => [
  GoRoute(
    path: '/',
    redirect: (_, state) {
      final uri = state.uri;
      final hasQuery = uri.queryParameters.isNotEmpty;

      if (!hasQuery && uri.path == '/') {
        return '/workbench';
      }
      return null;
    },
  ),
  ...WorkbenchRoutes.routes(),
];

/// @no-doc
extension AppRoutesMethods on BuildContext {
  /// @no-doc
  void navigateBackOrHome() {
    if (canPop()) {
      //Logger.instance.info('Navigating back');
      pop();
    } else {
      goNamed(appInitialLocation);
    }
  }
}
