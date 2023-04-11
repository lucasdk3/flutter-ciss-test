import 'package:flutter_ciss_test/ciss_test_exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const todoJson = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  };
  const todoModel =
      TodoModel(userId: 1, id: 1, title: 'test', completed: false);
  group('TodoModel', () {
    test('deve ser criado a partir do JSON corretamente', () {
      final todo = TodoModel.fromJson(todoJson);

      expect(todo.userId, equals(todoJson['userId']));
      expect(todo.id, equals(todoJson['id']));
      expect(todo.title, equals(todoJson['title']));
      expect(todo.completed, equals(todoJson['completed']));
    });

    test('deve ser convertido para JSON corretamente', () {
      final todo = todoModel.toJson();

      expect(todo['userId'], equals(1));
      expect(todo['id'], equals(1));
      expect(todo['title'], equals('test'));
      expect(todo['completed'], equals(false));
    });

    test('deve ser convertido para uma entidade corretamente', () {
      final todoEntity = todoModel.toEntity;

      expect(todoEntity.userId, equals(todoModel.userId));
      expect(todoEntity.id, equals(todoModel.id));
      expect(todoEntity.title, equals(todoModel.title));
      expect(todoEntity.completed, equals(todoModel.completed));
    });

    test('deve ser copiado corretamente', () {
      final todo2 = todoModel.copyWith(id: 2);

      expect(todo2.userId, equals(todoModel.userId));
      expect(todo2.id, equals(2));
      expect(todo2.title, equals(todoModel.title));
      expect(todo2.completed, equals(todoModel.completed));
    });
  });
}
