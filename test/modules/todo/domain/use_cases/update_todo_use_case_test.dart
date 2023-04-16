import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late ITodoRepository repository;
  late IUpdateTodoUseCase usecase;

  setUp(() {
    repository = MockTodoRepository();
    usecase = UpdateTodoUseCaseImpl(repository);
  });

  test('should update a todo', () async {
    // Arrange

    when(() => repository.update(todoEntity: TodoMocksTest.todoEntity))
        .thenAnswer((_) async => const Right(TodoMocksTest.todoEntity));

    // Act
    final result = await usecase.call(todoEntity: TodoMocksTest.todoEntity);

    // Assert
    expect(result, const Right(TodoMocksTest.todoEntity));
    verify(() => repository.update(todoEntity: TodoMocksTest.todoEntity))
        .called(1);
  });
}
