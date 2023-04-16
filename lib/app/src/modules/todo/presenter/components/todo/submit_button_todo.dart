// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../ciss_test_exports.dart';

class SubmitTodoButton extends StatelessWidget {
  final TodosBloc todosBloc;
  final TodoBloc todoBloc;
  final bool isEdit;
  const SubmitTodoButton(
      {super.key,
      required this.todosBloc,
      required this.todoBloc,
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
        bloc: todoBloc,
        listener: (context, state) {
          SubmitTodoProcess.call(context,
              state: state,
              isEdit: isEdit,
              todoBloc: todoBloc,
              todosBloc: todosBloc);
        },
        builder: (context, state) => UiButton(
              onPressed: () async {
                final isValid = todoBloc.form.formGroup.valid;

                isValid
                    ? todoBloc.add(isEdit
                        ? SubmitUpdateTodoEvent()
                        : SubmitInsertTodoEvent())
                    : todoBloc.form.showErrors();
              },
              isLoading: state is TodoLoading,
              label: ConstantsLabels.save,
              height: 80,
            ));
  }
}
