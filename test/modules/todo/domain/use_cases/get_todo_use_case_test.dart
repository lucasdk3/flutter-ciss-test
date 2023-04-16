import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late ITodoRepository repository;
  late IGetTodoUseCase usecase;

  setUp(() {
    repository = MockTodoRepository();
    usecase = GetTodoUseCaseImpl(repository);
  });

  test('should return a todo based on the id', () async {
    // Arrange

    when(() => repository.get(id: TodoMocksTest.id))
        .thenAnswer((_) async => const Right(TodoMocksTest.todoEntity));

    // Act
    final result = await usecase.call(id: TodoMocksTest.id);

    // Assert
    expect(result, const Right(TodoMocksTest.todoEntity));
    verify(() => repository.get(id: TodoMocksTest.id)).called(1);
  });
}
