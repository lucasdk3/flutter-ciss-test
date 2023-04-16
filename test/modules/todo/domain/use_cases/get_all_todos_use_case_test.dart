import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late ITodoRepository repository;
  late IGetAllTodosUseCase usecase;

  setUp(() {
    repository = MockTodoRepository();
    usecase = GetAllTodosUseCaseImpl(repository);
  });

  test('should return a list of todos based on the filter', () async {
    // Arrange
    const filterTodos = FilterTodos.completed;
    final todos = [TodoMocksTest.todoEntity];

    when(() => repository.getAll(filterTodos: filterTodos))
        .thenAnswer((_) async => Right(todos));

    // Act
    final result = await usecase.call(filterTodos: filterTodos);

    // Assert
    expect(result, Right(todos));
    verify(() => repository.getAll(filterTodos: filterTodos)).called(1);
  });
}
