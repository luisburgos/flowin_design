import 'package:example/modules/workbench/body/body_builder.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:example/shared/workbench/workbench.dart';
import 'package:example/shared/workbench/workbench_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// @no-doc
class WorkbenchPage extends StatelessWidget {
  /// @no-doc
  const WorkbenchPage({this.query, super.key});

  /// @no-doc
  final WorkbenchQuery? query;

  @override
  Widget build(BuildContext context) {
    Logger.instance.info('✅ WorkbenchScreen build ran, query: $query');
    var initialState = const WorkbenchState(
      visiblePanes: {WorkbenchPane.left, WorkbenchPane.sideBar},
    );
    if (query != null) {
      final fromQuery = WorkbenchState.fromQuery(query!);
      initialState = initialState.copyWith(
        sidebarItem: fromQuery.sidebarItem ?? initialState.sidebarItem,
        visiblePanes: fromQuery.visiblePanes.isNotEmpty
            ? fromQuery.visiblePanes
            : initialState.visiblePanes,
        selectedFoundationsOption: () => fromQuery.selectedFoundationsOption,
        selectedComponentsOption: () => fromQuery.selectedComponentsOption,
      );
    }

    return BlocProvider(
      create: (_) => WorkbenchBloc(initialState),
      child: BlocBuilder<WorkbenchBloc, WorkbenchState>(
        builder: (context, state) {
          final effectiveState = initialState.copyWith(
            sidebarItem: initialState.sidebarItem ?? state.sidebarItem,
            visiblePanes: query?.visiblePanes != null
                ? initialState.visiblePanes
                : state.visiblePanes,
            selectedFoundationsOption: () =>
                initialState.selectedFoundationsOption ??
                state.selectedFoundationsOption,
            selectedComponentsOption: () =>
                initialState.selectedComponentsOption ??
                state.selectedComponentsOption,
          );

          return WorkbenchView(
            title: 'Flowin Design',
            state: effectiveState,
            body: BodyBuilder(state: effectiveState),
          );
        },
      ),
    );
  }
}
