import 'package:dartz/dartz.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../external/datasources/todo_mocks.dart';

class MockTodoDatasource extends Mock implements ITodoDatasource {}

void main() {
  late TodoRepositoryImpl todoRepositoryImpl;
  late MockTodoDatasource mockTodoDatasource;

  setUp(() {
    mockTodoDatasource = MockTodoDatasource();
    todoRepositoryImpl = TodoRepositoryImpl(mockTodoDatasource);
  });

  group('TodoRepositoryImpl', () {
    group('Get', () {
      test('should get a todo entity from the datasource', () async {
        // arrange
        final todoEntity = TodoMocksTest.todoModel.toEntity;
        when(() => mockTodoDatasource.get(id: TodoMocksTest.id))
            .thenAnswer((_) async => TodoMocksTest.todoModel);

        // act
        final result = await todoRepositoryImpl.get(id: TodoMocksTest.id);

        // assert
        expect(result, Right(todoEntity));
      });

      test('should return Failure', () async {
        // arrange
        when(() => mockTodoDatasource.get(id: TodoMocksTest.id))
            .thenThrow(TodoMocksTest.errorResponse);

        // act
        final result = await todoRepositoryImpl.get(id: TodoMocksTest.id);

        // assert
        expect(result, equals(left(TodoMocksTest.errorResponse)));
      });
    });

    group('GetAll', () {
      test('should get all todo entities from the datasource', () async {
        // arrange
        const filterTodos = FilterTodos.all;

        when(() => mockTodoDatasource.getAll(filterTodos: filterTodos))
            .thenAnswer((_) async => TodoMocksTest.todoModels);

        // act
        final result =
            await todoRepositoryImpl.getAll(filterTodos: filterTodos);

        // assert
        expect(result.fold(id, id), isA<List<TodoEntity>>());
      });

      test('should return Failure', () async {
        // arrange
        when(() => mockTodoDatasource.getAll(filterTodos: FilterTodos.all))
            .thenThrow(TodoMocksTest.errorResponse);

        // act
        final result =
            await todoRepositoryImpl.getAll(filterTodos: FilterTodos.all);

        // assert
        expect(result, equals(left(TodoMocksTest.errorResponse)));
      });
    });

    group('Insert', () {
      test('should insert a todo entity to the datasource', () async {
        // arrange
        final todoModel = TodoMocksTest.todoEntity.toModel;
        when(() => mockTodoDatasource.insert(todoModel: todoModel))
            .thenAnswer((_) async => todoModel);

        // act
        final result = await todoRepositoryImpl.insert(
            todoEntity: TodoMocksTest.todoEntity);

        // assert
        expect(result.fold(id, id), isA<TodoEntity>());
      });

      test('should return Failure', () async {
        // arrange
        when(() =>
                mockTodoDatasource.insert(todoModel: TodoMocksTest.todoModel))
            .thenThrow(TodoMocksTest.errorResponse);

        // act
        final result = await todoRepositoryImpl.insert(
            todoEntity: TodoMocksTest.todoEntity);

        // assert
        expect(result, equals(left(TodoMocksTest.errorResponse)));
      });
    });

    group('Update', () {
      test('should update a todo entity in the datasource', () async {
        // arrange

        final todoModel = TodoMocksTest.todoEntity.toModel;
        when(() => mockTodoDatasource.update(todoModel: todoModel))
            .thenAnswer((_) async => todoModel);

        // act
        final result = await todoRepositoryImpl.update(
            todoEntity: TodoMocksTest.todoEntity);

        // assert
        expect(result.fold(id, id), isA<TodoEntity>());
      });

      test('should return Failure', () async {
        // arrange
        when(() =>
                mockTodoDatasource.update(todoModel: TodoMocksTest.todoModel))
            .thenThrow(TodoMocksTest.errorResponse);

        // act
        final result = await todoRepositoryImpl.update(
            todoEntity: TodoMocksTest.todoEntity);

        // assert
        expect(result, equals(left(TodoMocksTest.errorResponse)));
      });
    });

    group('Delete', () {
      test('should return SuccessResponse', () async {
        // arrange
        when(() => mockTodoDatasource.delete(id: TodoMocksTest.id))
            .thenAnswer((_) async => SuccessResponse());

        // act
        final result = await todoRepositoryImpl.delete(id: TodoMocksTest.id);

        // assert
        expect(result.fold(id, id), isA<SuccessResponse>());
      });

      test('should return Failure', () async {
        // arrange
        when(() => mockTodoDatasource.delete(id: TodoMocksTest.id))
            .thenThrow(TodoMocksTest.errorResponse);

        // act
        final result = await todoRepositoryImpl.delete(id: TodoMocksTest.id);

        // assert
        expect(result, equals(left(TodoMocksTest.errorResponse)));
      });
    });
  });
}
