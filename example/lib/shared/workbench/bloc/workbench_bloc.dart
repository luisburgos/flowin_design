import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/modules/workbench/module_panes/components_module_pane.dart';
import 'package:example/modules/workbench/module_panes/foundations_module_pane.dart';
import 'package:example/shared/logger/logger.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:example/shared/workbench/workbench_query.dart';

part 'workbench_event.dart';
part 'workbench_state.dart';

/// @no-doc
class WorkbenchBloc extends Bloc<WorkbenchEvent, WorkbenchState> {
  /// @no-doc
  WorkbenchBloc(super.initialState) {
    Logger.instance.info('✅ WorkbenchBloc constructor ran: $state');

    on<TogglePane>((e, emit) {
      final newSet = {...state.visiblePanes};
      if (newSet.contains(e.pane)) {
        newSet.remove(e.pane);
      } else {
        newSet.add(e.pane);
      }
      emit(state.copyWith(visiblePanes: newSet));
    });

    on<OpenPane>((e, emit) {
      emit(state.copyWith(visiblePanes: {...state.visiblePanes, e.pane}));
    });

    on<MinimizePane>((e, emit) {
      final newSet = {...state.visiblePanes}..remove(e.pane);
      emit(state.copyWith(visiblePanes: newSet));
    });

    on<SetSidebarItem>((e, emit) {
      final updatedVisiblePanes = state.visiblePanes;
      if (e.expandsLeftPane) {
        if (!updatedVisiblePanes.contains(WorkbenchPane.left)) {
          updatedVisiblePanes.add(WorkbenchPane.left);
        }
      }

      emit(
        state.copyWith(
          sidebarItem: e.item,
          visiblePanes: updatedVisiblePanes,
          selectedFoundationsOption: () => null,
        ),
      );
    });

    on<SetFoundationsPaneOption>((e, emit) {
      emit(
        state.copyWith(
          sidebarItem: e.pane,
          visiblePanes: {...state.visiblePanes, WorkbenchPane.left},
          selectedFoundationsOption: () => e.item,
        ),
      );
    });

    on<SetComponentsPaneOption>((e, emit) {
      emit(state.copyWith(selectedComponentsOption: () => e.option));
    });
  }
}
