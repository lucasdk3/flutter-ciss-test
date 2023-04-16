// coverage:ignore-file
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../../ciss_test_exports.dart';

class FormsTodos extends StatelessWidget {
  final TodoBloc todoBloc;
  const FormsTodos({super.key, required this.todoBloc});

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: todoBloc.form.formGroup,
        child: Column(
          children: [
            const UiField(
                labelText: ConstantsLabels.title,
                formControlName: ConstantsForms.title,
                maxLenght: 100,
                minLenght: 3,
                maxLines: 10,
                minLines: 10,
                helperText: ConstantsStrings.titleHelper),
            const SizedBox(height: 60),
            Row(
              children: [
                ReactiveFormConsumer(builder: (context, form, child) {
                  final completed =
                      form.control(ConstantsForms.completed).value;
                  return UiCheckBox(
                      value: completed,
                      onChanged: (value) =>
                          todoBloc.form.setCompleted = value ?? false);
                }),
                const SizedBox(width: 24),
                AutoSizeText(
                  ConstantsLabels.completed,
                  style: ThemeService.styles.ralewayBody(),
                )
              ],
            ),
            const SizedBox(height: 24),
          ],
        ));
  }
}
