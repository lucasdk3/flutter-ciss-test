// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../ciss_test_exports.dart';

class SubmitTodoProcess {
  static void call(BuildContext context,
      {required bool isEdit,
      required TodoState state,
      required TodoBloc todoBloc,
      required TodosBloc todosBloc}) {
    if (state is TodoSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
        todoBloc.form.reset();
        todosBloc.add(const GetAllTodosEvent(filter: FilterTodos.all));
        todoBloc.add(ResetTodoEvent());
      });
    } else if (state is TodoError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (context) => UiErrorDialog(
                  error: state.failure,
                  primaryButtonText: ConstantsStrings.tryAgain,
                  secondaryButtonText: ConstantsStrings.close,
                  onPressedPrimaryButton: () async {
                    Navigator.pop(context);
                    final isValid = todoBloc.form.formGroup.valid;

                    isValid
                        ? todoBloc.add(isEdit
                            ? SubmitUpdateTodoEvent()
                            : SubmitInsertTodoEvent())
                        : todoBloc.form.showErrors();
                  },
                  onPressedSecondaryButton: () => Navigator.pop(context),
                ));
      });
    }
  }
}
