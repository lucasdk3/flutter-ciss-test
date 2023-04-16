import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late ITodoRepository repository;
  late IInsertTodoUseCase usecase;

  setUp(() {
    repository = MockTodoRepository();
    usecase = InsertTodoUseCaseImpl(repository);
  });

  test('should insert a new todo', () async {
    // Arrange

    when(() => repository.insert(todoEntity: TodoMocksTest.todoEntity))
        .thenAnswer((_) async => const Right(TodoMocksTest.todoEntity));

    // Act
    final result = await usecase.call(todoEntity: TodoMocksTest.todoEntity);

    // Assert
    expect(result, const Right(TodoMocksTest.todoEntity));
    verify(() => repository.insert(todoEntity: TodoMocksTest.todoEntity))
        .called(1);
  });
}
