import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../../../ciss_test_exports.dart';

class TodoPage extends StatefulWidget {
  final TodoEntity? todoEntity;
  final bool isEdit;
  const TodoPage({super.key, this.todoEntity, required this.isEdit});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final todoBloc = GetIt.I.get<TodoBloc>();
  final todosBloc = GetIt.I.get<TodosBloc>();

  @override
  void initState() {
    if (widget.isEdit) {
      todoBloc.add(SetFormTodoEvent(todoEntity: widget.todoEntity));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = GetIt.I.get<TodoBloc>();
    final todosBloc = GetIt.I.get<TodosBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const UiBackButton(),
                        AutoSizeText(
                          ConstantsStrings.todo,
                          style: ThemeService.styles.ralewayTitle(),
                        ),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: AutoSizeText(
                        ConstantsStrings.todosSubtitle,
                        style: ThemeService.styles.ralewaySubtitle(),
                      ),
                    ),
                  ],
                ),
                FormsTodos(todoBloc: todoBloc),
                Column(
                  children: [
                    SubmitTodoButton(
                      isEdit: widget.isEdit,
                      todoBloc: todoBloc,
                      todosBloc: todosBloc,
                    ),
                    const SizedBox(height: 24),
                    DeleteTodoButton(
                      todoEntity: widget.todoEntity,
                      todoBloc: todoBloc,
                      todosBloc: todosBloc,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
