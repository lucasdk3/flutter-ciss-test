// coverage:ignore-file
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../ciss_test_exports.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeService.colors.white));
    final todosBloc = GetIt.I.get<TodosBloc>();
    final todoBloc = GetIt.I.get<TodoBloc>();
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
                AutoSizeText(
                  ConstantsStrings.todos,
                  style: ThemeService.styles.ralewayTitle(),
                ),
                const SizedBox(height: 24),
                AutoSizeText(
                  ConstantsStrings.todosSubtitle,
                  style: ThemeService.styles.ralewaySubtitle(),
                ),
                const SizedBox(height: 24),
                FilterTabTodos(todosBloc: todosBloc),
                const SizedBox(height: 24),
                SearchTodosField(todosBloc: todosBloc),
                ListTodos(todosBloc: todosBloc, todoBloc: todoBloc)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(
            '${ConstantsRoutes.todos}/${ConstantsRoutes.todo}?isEdit=false'),
        backgroundColor: ThemeService.colors.white,
        child: Icon(Icons.add, size: 24, color: ThemeService.colors.primary),
      ),
    );
  }
}
