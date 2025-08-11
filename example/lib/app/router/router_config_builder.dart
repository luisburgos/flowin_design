import 'package:example/app/router/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// @no-doc
GoRouter appRouterConfigBuilder(
  BuildContext context, {
  bool enableDeveloperOptions = false,
}) {
  final routes = appRoutes();
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    //initialLocation: appInitialLocation,
    routes: routes,
    errorBuilder: (context, state) {
      return Scaffold(body: Center(child: Text(state.error.toString())));
    },
  );
}
