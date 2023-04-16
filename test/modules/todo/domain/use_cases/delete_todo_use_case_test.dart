import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late ITodoRepository repository;
  late IDeleteTodoUseCase usecase;

  setUp(() {
    repository = MockTodoRepository();
    usecase = DeleteTodoUseCaseImpl(repository);
  });

  test('should delete a todo by its id', () async {
    // Arrange
    final response = SuccessResponse();

    when(() => repository.delete(id: TodoMocksTest.id))
        .thenAnswer((_) async => Right(response));

    // Act
    final result = await usecase.call(id: TodoMocksTest.id);

    // Assert
    expect(result, Right(response));
    verify(() => repository.delete(id: TodoMocksTest.id)).called(1);
  });
}
