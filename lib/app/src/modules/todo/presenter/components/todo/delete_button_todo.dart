// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../ciss_test_exports.dart';

class DeleteTodoButton extends StatelessWidget {
  final TodosBloc todosBloc;
  final TodoBloc todoBloc;
  final TodoEntity? todoEntity;
  const DeleteTodoButton(
      {super.key,
      required this.todosBloc,
      required this.todoBloc,
      this.todoEntity});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
        bloc: todoBloc,
        listener: (context, state) {
          DeleteTodoProcess.call(context,
              state: state,
              todoBloc: todoBloc,
              todosBloc: todosBloc,
              todoEntity: todoEntity ?? const TodoEntity());
        },
        builder: (context, state) => UiButton(
              onPressed: () async =>
                  todoBloc.add(SubmitDeleteTodoEvent(id: todoEntity?.id ?? 1)),
              isLoading: state is TodoLoading,
              buttonColor: ThemeService.colors.danger,
              label: ConstantsLabels.delete,
              height: 80,
            ));
  }
}
