// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../ciss_test_exports.dart';

class ItemTodo extends StatelessWidget {
  final TodoBloc todoBloc;
  final TodosBloc todosBloc;
  final TodoEntity todoEntity;
  const ItemTodo(
      {super.key,
      required this.todoBloc,
      required this.todoEntity,
      required this.todosBloc});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = (todoEntity.completed ?? false)
        ? ThemeService.colors.primary
        : ThemeService.colors.white;
    final bodyColor = (todoEntity.completed ?? false)
        ? ThemeService.colors.white
        : ThemeService.colors.primary;
    return Card(
      elevation: 4,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 80),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: ItemTodoCheckBox(
                    todoBloc: todoBloc,
                    todosBloc: todosBloc,
                    todoEntity: todoEntity,
                  )),
              Flexible(
                  flex: 8,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      todoEntity.title ?? '',
                      style: ThemeService.styles.ralewayBody(color: bodyColor),
                      textAlign: TextAlign.start,
                    ),
                  )),
              Flexible(
                flex: 3,
                child: ItemTodoButtons(
                    bodyColor: bodyColor,
                    todoBloc: todoBloc,
                    todosBloc: todosBloc,
                    todoEntity: todoEntity),
              )
            ],
          ),
        ),
      ),
    );
  }
}
