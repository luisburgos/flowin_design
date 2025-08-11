import 'package:example/app/router/routes/routes.dart';
import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// @no-doc
class OnWorkbenchStateChanged extends StatelessWidget {
  /// @no-doc
  const OnWorkbenchStateChanged({required this.child, super.key});

  /// @no-doc
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkbenchBloc, WorkbenchState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        final uri = state.toQuery().toUri(WorkbenchRoutes.rootRouteLocation);
        context.go(uri.toString());
      },
      child: child,
    );
  }
}
