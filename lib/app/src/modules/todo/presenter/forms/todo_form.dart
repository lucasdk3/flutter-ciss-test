import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../ciss_test_exports.dart';

class TodoForm {
  final formGroup = FormGroup({
    ConstantsForms.id: FormControl<int>(value: null),
    ConstantsForms.title: FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(3),
      Validators.maxLength(100)
    ]),
    ConstantsForms.completed:
        FormControl<bool>(value: false, validators: [Validators.required]),
  });

  int? get id => formGroup.control(ConstantsForms.id).value;
  String get title => formGroup.control(ConstantsForms.title).value;
  bool get completed => formGroup.control(ConstantsForms.completed).value;

  set setId(int value) => formGroup.control(ConstantsForms.id).value = value;
  set setTitle(String value) =>
      formGroup.control(ConstantsForms.title).value = value;
  set setCompleted(bool value) =>
      formGroup.control(ConstantsForms.completed).value = value;

  void setTodo(TodoEntity todoEntity) {
    setId = todoEntity.id ?? 1;
    setCompleted = todoEntity.completed ?? false;
    setTitle = todoEntity.title ?? '';
  }

  void reset() {
    formGroup.control(ConstantsForms.title).value = '';
    formGroup.control(ConstantsForms.completed).value = false;
    formGroup.control(ConstantsForms.title).markAsUntouched();
    formGroup.control(ConstantsForms.completed).markAsUntouched();
  }

  void showErrors() {
    formGroup.control(ConstantsForms.title).markAsTouched();
    formGroup.control(ConstantsForms.title).markAsDirty();
  }
}

extension TodoFormToEntity on TodoForm {
  TodoEntity toEntity({bool? completed}) => TodoEntity(
        id: id,
        title: title,
        completed: completed ?? this.completed,
        userId: 1,
      );
}
