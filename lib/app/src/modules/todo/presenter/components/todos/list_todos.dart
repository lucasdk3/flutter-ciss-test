// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../ciss_test_exports.dart';

class ListTodos extends StatelessWidget {
  final TodosBloc todosBloc;
  final TodoBloc todoBloc;
  const ListTodos({super.key, required this.todosBloc, required this.todoBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
        bloc: todosBloc,
        builder: (context, state) {
          if (state is TodosSuccess) {
            final todos = (state.searchedTodos.isNotEmpty)
                ? state.searchedTodos
                : state.todos;
            return Wrap(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ItemTodos(
                        todoBloc: todoBloc,
                        todoEntity: todos[index],
                        todosBloc: todosBloc,
                      );
                    }),
              ],
            );
          } else if (state is TodosEmpty) {
            return const EmptyPage(emptyText: ConstantsStrings.todosEmpty);
          } else {
            return const UiSkeletonList(
              enable: true,
              length: 20,
            );
          }
        });
  }
}
