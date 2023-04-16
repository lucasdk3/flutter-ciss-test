import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

void main() {
  group('TodoForm', () {
    late TodoForm todoForm;

    setUp(() {
      todoForm = TodoForm();
    });

    test('when call reset should title empty and completed false', () {
      todoForm.setTitle = 'Todo 1';
      todoForm.setCompleted = true;

      expect(todoForm.title, 'Todo 1');
      expect(todoForm.completed, true);

      todoForm.reset();
      expect(todoForm.title, '');
      expect(todoForm.completed, false);
    });

    test('when call showErrors should return errors in title control', () {
      todoForm.setTitle = 'T';

      expect(todoForm.title, 'T');

      todoForm.showErrors();
      expect(todoForm.formGroup.control(ConstantsForms.title).hasErrors, true);
    });
  });
}
