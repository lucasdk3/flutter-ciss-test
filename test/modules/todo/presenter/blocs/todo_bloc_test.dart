import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

import '../../external/datasources/todo_mocks.dart';

class MockGetTodoUseCase extends Mock implements IGetTodoUseCase {}

class MockInsertTodoUseCase extends Mock implements IInsertTodoUseCase {}

class MockUpdateTodoUseCase extends Mock implements IUpdateTodoUseCase {}

class MockDeleteTodoUseCase extends Mock implements IDeleteTodoUseCase {}

class MockTodoForm extends Mock implements TodoForm {}

void main() {
  group('TodoBloc', () {
    late IGetTodoUseCase mockGetUseCase;
    late IInsertTodoUseCase mockInsertUseCase;
    late IUpdateTodoUseCase mockUpdateUseCase;
    late IDeleteTodoUseCase mockDeleteUseCase;
    late TodoForm todoForm;
    late TodoBloc todoBloc;

    setUp(() {
      registerFallbackValue(ResetTodoEvent());
      todoForm = TodoForm();
      mockGetUseCase = MockGetTodoUseCase();
      mockInsertUseCase = MockInsertTodoUseCase();
      mockUpdateUseCase = MockUpdateTodoUseCase();
      mockDeleteUseCase = MockDeleteTodoUseCase();
      todoBloc = TodoBloc(
        getUseCase: mockGetUseCase,
        insertUseCase: mockInsertUseCase,
        updateUseCase: mockUpdateUseCase,
        deleteUseCase: mockDeleteUseCase,
        form: todoForm,
      );
    });

    tearDown(() {
      todoBloc.close();
    });

    group('SetFormTodoEvent', () {
      test('should emit TodoLoading and TodoSuccess when insert todo succeeds',
          () async {
        todoBloc
            .add(const SetFormTodoEvent(todoEntity: TodoMocksTest.todoEntity));

        await Future.delayed(const Duration(seconds: 1));

        expectLater(todoBloc.form.id, TodoMocksTest.todoEntity.id);
        expectLater(
            todoBloc.form.completed, TodoMocksTest.todoEntity.completed);
        expectLater(todoBloc.form.title, TodoMocksTest.todoEntity.title);
      });
    });
    group('SubmitInsertTodoEvent', () {
      test('should emit TodoLoading and TodoSuccess when insert todo succeeds',
          () async {
        when(() => mockInsertUseCase.call(todoEntity: TodoMocksTest.todoEntity))
            .thenAnswer((_) async => const Right(TodoMocksTest.todoEntity));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            TodoSuccess(),
          ]),
        );

        todoBloc
            .add(const SetFormTodoEvent(todoEntity: TodoMocksTest.todoEntity));

        await Future.delayed(const Duration(seconds: 1));

        todoBloc.add(SubmitInsertTodoEvent());
      });

      test('should emit TodoLoading and TodoError when insert todo failure',
          () async {
        when(() => mockInsertUseCase.call(todoEntity: TodoMocksTest.todoEntity))
            .thenAnswer((_) async => const Left(TodoMocksTest.errorResponse));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            const TodoError(failure: TodoMocksTest.errorResponse),
          ]),
        );

        todoBloc
            .add(const SetFormTodoEvent(todoEntity: TodoMocksTest.todoEntity));

        await Future.delayed(const Duration(seconds: 1));

        todoBloc.add(SubmitInsertTodoEvent());
      });
    });

    group('SubmitUpdateTodoEvent', () {
      test('should emit TodoLoading and TodoSuccess when update todo succeeds',
          () async {
        when(() => mockUpdateUseCase.call(todoEntity: TodoMocksTest.todoEntity))
            .thenAnswer((_) async => const Right(TodoMocksTest.todoEntity));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            TodoSuccess(),
          ]),
        );

        todoBloc
            .add(const SetFormTodoEvent(todoEntity: TodoMocksTest.todoEntity));

        await Future.delayed(const Duration(seconds: 1));

        todoBloc.add(SubmitUpdateTodoEvent());
      });

      test('should emit TodoLoading and TodoError when update todo failure',
          () async {
        when(() => mockUpdateUseCase.call(todoEntity: TodoMocksTest.todoEntity))
            .thenAnswer((_) async => const Left(TodoMocksTest.errorResponse));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            const TodoError(failure: TodoMocksTest.errorResponse),
          ]),
        );

        todoBloc
            .add(const SetFormTodoEvent(todoEntity: TodoMocksTest.todoEntity));

        await Future.delayed(const Duration(seconds: 1));

        todoBloc.add(SubmitUpdateTodoEvent());
      });
    });

    group('SubmitDeleteTodoEvent', () {
      test('should emit TodoLoading and TodoSuccess when delete todo succeeds',
          () async {
        when(() => mockDeleteUseCase.call(id: TodoMocksTest.id))
            .thenAnswer((_) async => Right(SuccessResponse()));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            TodoSuccess(),
          ]),
        );

        todoBloc.add(const SubmitDeleteTodoEvent(id: TodoMocksTest.id));
      });

      test('should emit TodoLoading and TodoError when delete todo failure',
          () async {
        when(() => mockDeleteUseCase.call(id: TodoMocksTest.id))
            .thenAnswer((_) async => const Left(TodoMocksTest.errorResponse));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            const TodoError(failure: TodoMocksTest.errorResponse),
          ]),
        );

        todoBloc.add(const SubmitDeleteTodoEvent(id: TodoMocksTest.id));
      });
    });

    group('SubmitCompletedTodoEvent', () {
      test(
          'should emit TodoLoading and TodoSuccess when update completed succeeds',
          () async {
        when(() => mockUpdateUseCase.call(todoEntity: TodoMocksTest.todoEntity))
            .thenAnswer((_) async => const Right(TodoMocksTest.todoEntity));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            TodoSuccess(),
          ]),
        );

        todoBloc.add(const SubmitCompletedTodoEvent(
            todoEntity: TodoMocksTest.todoEntity));
      });

      test(
          'should emit TodoLoading and TodoError when update completed failure',
          () async {
        when(() => mockUpdateUseCase.call(todoEntity: TodoMocksTest.todoEntity))
            .thenAnswer((_) async => const Left(TodoMocksTest.errorResponse));

        expectLater(
          todoBloc.stream,
          emitsInOrder([
            TodoLoading(),
            const TodoError(failure: TodoMocksTest.errorResponse),
          ]),
        );

        todoBloc.add(const SubmitCompletedTodoEvent(
            todoEntity: TodoMocksTest.todoEntity));
      });
    });

    group('ResetTodoEvent', () {
      test('emits TodoInitial() when ResetTodoEvent is added', () {
        todoBloc.add(ResetTodoEvent());

        emitsInOrder([TodoInitial()]);
      });
    });
  });
}
