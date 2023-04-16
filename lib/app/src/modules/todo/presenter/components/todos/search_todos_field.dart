// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../../ciss_test_exports.dart';

class SearchTodosField extends StatelessWidget {
  final TodosBloc todosBloc;
  const SearchTodosField({super.key, required this.todosBloc});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => todosBloc.searchForm.formGroup,
      builder: (context, form, child) => UiField(
          labelText: ConstantsLabels.search,
          formControlName: ConstantsForms.search,
          suffix: Padding(
              padding: const EdgeInsets.all(8),
              child: ThemeService.icons.searchIcon)),
    );
  }
}
