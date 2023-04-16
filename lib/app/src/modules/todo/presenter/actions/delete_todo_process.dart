// coverage:ignore-file
import 'package:flutter/material.dart';

import '../../../../../../../ciss_test_exports.dart';

class DeleteTodoProcess {
  static void call(BuildContext context,
      {required TodoState state,
      required TodoBloc todoBloc,
      required TodosBloc todosBloc,
      required TodoEntity todoEntity}) {
    if (state is TodoSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
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
                    todoBloc.add(SubmitDeleteTodoEvent(id: todoEntity.id ?? 1));
                  },
                  onPressedSecondaryButton: () => Navigator.pop(context),
                ));
      });
    }
  }
}
