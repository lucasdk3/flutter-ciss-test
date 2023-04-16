import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

void main() {
  group('TodosSearchForm', () {
    late TodosSearchForm todosSearchForm;

    setUp(() {
      todosSearchForm = TodosSearchForm();
    });

    test('when call setSearch should return search value equals', () {
      todosSearchForm.setSearch = 'Todo 1';

      expect(todosSearchForm.search, 'Todo 1');
    });

    test('when call reset should return search value empty', () {
      todosSearchForm.setSearch = 'Todo 1';

      expect(todosSearchForm.search, 'Todo 1');

      todosSearchForm.reset();

      expect(todosSearchForm.search, '');
    });
  });
}
