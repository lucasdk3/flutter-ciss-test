// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../ciss_test_exports.dart';

class ItemTodosButtons extends StatelessWidget {
  final Color bodyColor;
  final TodoBloc todoBloc;
  final TodosBloc todosBloc;
  final TodoEntity todoEntity;
  const ItemTodosButtons(
      {super.key,
      required this.bodyColor,
      required this.todoBloc,
      required this.todosBloc,
      required this.todoEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: InkWell(
              onTap: () => context.push<TodoEntity>(
                  '${ConstantsRoutes.todos}/${ConstantsRoutes.todo}?isEdit=true',
                  extra: todoEntity),
              child: ThemeService.icons.updateIcon(color: bodyColor)),
        ),
        const Spacer(),
        Flexible(
          child: BlocConsumer<TodoBloc, TodoState>(
            bloc: todoBloc,
            listener: (context, state) {
              DeleteTodoProcess.call(context,
                  state: state,
                  todoBloc: todoBloc,
                  todosBloc: todosBloc,
                  todoEntity: todoEntity);
            },
            builder: (context, state) {
              return InkWell(
                  onTap: () => todoBloc
                      .add(SubmitDeleteTodoEvent(id: todoEntity.id ?? 1)),
                  child: ThemeService.icons.deleteIcon(color: bodyColor));
            },
          ),
        )
      ],
    );
  }
}
