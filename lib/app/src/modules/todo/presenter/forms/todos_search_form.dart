import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../ciss_test_exports.dart';

class TodosSearchForm {
  final formGroup = FormGroup({
    ConstantsForms.search: FormControl<String>(value: ''),
  });

  String get search => formGroup.control(ConstantsForms.search).value;

  set setSearch(String value) =>
      formGroup.control(ConstantsForms.search).value = value;

  void reset() {
    formGroup.control(ConstantsForms.search).value = '';
    formGroup.control(ConstantsForms.search).markAsUntouched();
  }
}
