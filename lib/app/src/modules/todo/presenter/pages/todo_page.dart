// coverage:ignore-file
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeService.colors.white));
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
      backgroundColor: ThemeService.colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: context.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 40),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: AutoSizeText(
                        ConstantsStrings.todoSubtitle(widget.isEdit),
                        style: ThemeService.styles.ralewaySubtitle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                FormsTodos(todoBloc: todoBloc),
                const SizedBox(height: 32),
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
