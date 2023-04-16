// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../ciss_test_exports.dart';

class ItemTodosCheckBox extends StatelessWidget {
  final TodosBloc todosBloc;
  final TodoBloc todoBloc;
  final TodoEntity todoEntity;
  const ItemTodosCheckBox(
      {super.key,
      required this.todosBloc,
      required this.todoBloc,
      required this.todoEntity});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
        bloc: todoBloc,
        listener: (context, state) {
          CompletedTodoProcess.call(context,
              state: state,
              todoBloc: todoBloc,
              todosBloc: todosBloc,
              todoEntity: todoEntity);
        },
        builder: (context, state) => UiCheckBox(
              value: todoEntity.completed ?? false,
              onChanged: (value) => todoBloc.add(SubmitCompletedTodoEvent(
                  todoEntity: todoEntity.copyWith(completed: value))),
            ));
  }
}
