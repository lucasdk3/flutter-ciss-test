import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockGetAllTodosUseCase extends Mock implements IGetAllTodosUseCase {}

TodosBloc _createBloc(
    MockGetAllTodosUseCase useCase, TodosSearchForm searchForm) {
  return TodosBloc(getAllUseCase: useCase, searchForm: searchForm);
}

void main() {
  group('TodosBloc', () {
    late MockGetAllTodosUseCase useCase;
    late TodosSearchForm searchForm;
    late TodosBloc todosBloc;

    setUp(() {
      useCase = MockGetAllTodosUseCase();
      searchForm = TodosSearchForm();
      todosBloc = _createBloc(useCase, searchForm);
    });

    tearDown(() => todosBloc.close());

    test('should initialize with GetAllTodosEvent and SearchTodosEvent',
        () async {
      // Arrange
      const searchValue = 'Todo 1';
      when(() => useCase.call(filterTodos: FilterTodos.all))
          .thenAnswer((_) async => Right(TodoMocksTest.todoEntities));

      // assert
      expectLater(
          todosBloc.stream,
          emitsInOrder([
            emits(const TodosLoading(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            )),
            emits(TodosSuccess(
              todos: TodoMocksTest.todoEntities,
              searchedTodos: const [],
              filter: FilterTodos.all,
            ))
          ]));

      // Act
      todosBloc.add(InitTodosEvent());

      // Act
      todosBloc.searchForm.setSearch = searchValue;

      // assert
      expectLater(
          todosBloc.stream,
          emitsInOrder([
            emits(TodosLoading(
              todos: TodoMocksTest.todoEntities,
              searchedTodos: const [],
              filter: FilterTodos.all,
            )),
            emits(TodosSuccess(
              todos: TodoMocksTest.todoEntities,
              searchedTodos: const [TodoMocksTest.todoEntity],
              filter: FilterTodos.all,
            ))
          ]));
    });

    test(
        'emits TodosSuccess when GetAllTodosEvent is added and use case returns success',
        () {
      // arrange
      when(() => useCase.call(filterTodos: FilterTodos.all))
          .thenAnswer((_) async => Right(TodoMocksTest.todoEntities));

      // assert
      expectLater(
          todosBloc.stream,
          emitsInOrder([
            emits(const TodosLoading(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            )),
            emits(TodosSuccess(
              todos: TodoMocksTest.todoEntities,
              searchedTodos: const [],
              filter: FilterTodos.all,
            ))
          ]));

      // act
      todosBloc.add(const GetAllTodosEvent(filter: FilterTodos.all));
    });

    test(
        'emits TodosError when GetAllTodosEvent is added and use case returns error',
        () {
      // arrange
      const failure = ErrorResponse(message: 'Error');
      when(() => useCase.call(filterTodos: FilterTodos.all))
          .thenAnswer((_) async => const Left(failure));

      // assert
      expectLater(
          todosBloc.stream,
          emitsInOrder([
            emits(const TodosLoading(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            )),
            emits(const TodosError(
              todos: [],
              searchedTodos: [],
              failure: failure,
              filter: FilterTodos.all,
            ))
          ]));

      // act
      todosBloc.add(const GetAllTodosEvent(filter: FilterTodos.all));
    });

    test('emits TodosSuccess state with searchedTodos after SearchTodosEvent',
        () {
      final todos = [
        const TodoModel(
            id: 1, title: 'Buy groceries', completed: false, userId: 1),
        const TodoModel(
            id: 2, title: 'Walk the dog', completed: false, userId: 1),
        const TodoModel(
            id: 3, title: 'Do laundry', completed: false, userId: 1),
      ];

      const searchedValue = 'dog';

      when(() => useCase.call(filterTodos: FilterTodos.all))
          .thenAnswer((_) async => Right(todos));

      //assert
      expectLater(
          todosBloc.stream,
          emitsInOrder([
            emits(const TodosLoading(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            )),
            emits(TodosSuccess(
                todos: todos,
                searchedTodos: const [],
                filter: FilterTodos.all)),
            emits(const TodosLoading(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            )),
            emits(TodosSuccess(
                todos: todos,
                searchedTodos: [todos[1]],
                filter: FilterTodos.all))
          ]));

      // Send GetAllTodosEvent to populate the initial todos state
      todosBloc.add(const GetAllTodosEvent(filter: FilterTodos.all));
      // Wait for the state transition to complete

      // Send SearchTodosEvent to update searchedTodos
      todosBloc.add(const SearchTodosEvent(searchValue: searchedValue));
      // Wait for the state transition to complete
    });

    test(
        'emits TodosEmpty when GetAllTodosEvent is added and use case returns empty',
        () {
      // arrange
      when(() => useCase.call(filterTodos: FilterTodos.all))
          .thenAnswer((_) async => const Right([]));

      // assert
      expectLater(
          todosBloc.stream,
          emitsInOrder([
            emits(const TodosLoading(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            )),
            emits(const TodosEmpty(
              todos: [],
              searchedTodos: [],
              filter: FilterTodos.all,
            ))
          ]));

      // act
      todosBloc.add(const GetAllTodosEvent(filter: FilterTodos.all));
    });
  });
}
