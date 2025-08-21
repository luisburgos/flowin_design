import 'package:example/shared/workbench/bloc/workbench_bloc.dart';
import 'package:example/shared/workbench/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('initial visible panes is empty', () {
    final bloc = WorkbenchBloc(const WorkbenchState());
    expect(bloc.state.visiblePanes, {WorkbenchPane.left});
  });
}
