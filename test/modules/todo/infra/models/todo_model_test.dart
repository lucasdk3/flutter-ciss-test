import 'package:flutter_ciss_test/ciss_test_exports.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../external/datasources/todo_mocks.dart';

void main() {
  group('TodoModel', () {
    test('deve ser criado a partir do JSON corretamente', () {
      final todo = TodoModel.fromJson(TodoMocksTest.todoJson);

      expect(todo.userId, equals(TodoMocksTest.todoJson['userId']));
      expect(todo.id, equals(TodoMocksTest.todoJson['id']));
      expect(todo.title, equals(TodoMocksTest.todoJson['title']));
      expect(todo.completed, equals(TodoMocksTest.todoJson['completed']));
    });

    test('deve ser convertido para JSON corretamente', () {
      final todo = TodoMocksTest.todoModel.toJson();

      expect(todo['userId'], equals(1));
      expect(todo['id'], equals(1));
      expect(todo['title'], equals('Todo 1'));
      expect(todo['completed'], equals(false));
    });

    test('deve ser convertido para uma entidade corretamente', () {
      final todoEntity = TodoMocksTest.todoModel.toEntity;

      expect(todoEntity.userId, equals(TodoMocksTest.todoModel.userId));
      expect(todoEntity.id, equals(TodoMocksTest.todoModel.id));
      expect(todoEntity.title, equals(TodoMocksTest.todoModel.title));
      expect(todoEntity.completed, equals(TodoMocksTest.todoModel.completed));
    });

    test('deve ser copiado corretamente', () {
      final todo2 = TodoMocksTest.todoModel.copyWith(id: 2);

      expect(todo2.userId, equals(TodoMocksTest.todoModel.userId));
      expect(todo2.id, equals(2));
      expect(todo2.title, equals(TodoMocksTest.todoModel.title));
      expect(todo2.completed, equals(TodoMocksTest.todoModel.completed));
    });
  });
}
