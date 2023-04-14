import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../ciss_test_exports.dart';

class FilterTabTodos extends StatelessWidget {
  final TodosBloc todosBloc;

  const FilterTabTodos({super.key, required this.todosBloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: BlocBuilder<TodosBloc, TodosState>(
          bloc: todosBloc,
          builder: (context, state) {
            return SegmentedButton<FilterTodos>(
                segments: const <ButtonSegment<FilterTodos>>[
                  ButtonSegment<FilterTodos>(
                      value: FilterTodos.all, label: Text(ConstantsLabels.all)),
                  ButtonSegment<FilterTodos>(
                      value: FilterTodos.completed,
                      label: Text(ConstantsLabels.completeds)),
                  ButtonSegment<FilterTodos>(
                      value: FilterTodos.incompleted,
                      label: Text(ConstantsLabels.incompleteds)),
                ],
                selected: <FilterTodos>{
                  state.filter
                },
                onSelectionChanged: (Set<FilterTodos> newSelection) {
                  todosBloc
                      .add(GetAllTodosEvent(filter: newSelection.first));
                },
                showSelectedIcon: false,
                style: ThemeService.styles.segmentedStyle());
          }),
    );
  }
}
