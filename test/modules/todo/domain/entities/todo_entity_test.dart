import 'package:flutter_ciss_test/ciss_test_exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const todo1 = TodoEntity(userId: 1, id: 1, title: 'test', completed: false);
  const todo2 = TodoEntity(userId: 1, id: 1, title: 'test', completed: false);
  const todo3 = TodoEntity(userId: 1, id: 2, title: 'test', completed: false);

  group('TodoEntity', () {
    test('dois objetos iguais devem ter o mesmo hashCode', () {
      expect(todo1.hashCode, equals(todo2.hashCode));
    });

    test('dois objetos iguais devem ser iguais', () {
      expect(todo1, equals(todo2));
    });

    test('dois objetos diferentes devem ter hashCodes diferentes', () {
      expect(todo1.hashCode, isNot(equals(todo3.hashCode)));
    });

    test('dois objetos diferentes não devem ser iguais', () {
      expect(todo1, isNot(equals(todo3)));
    });
  });
}
