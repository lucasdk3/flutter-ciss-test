import 'package:get_it/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

class MockApiService extends Mock implements IApiService {}

class MockTodoDatasource extends Mock implements ITodoDatasource {}

class MockTodoRepository extends Mock implements ITodoRepository {}

class MockGetTodoUseCase extends Mock implements IGetTodoUseCase {}

class MockGetAllTodosUseCase extends Mock implements IGetAllTodosUseCase {}

class MockInsertTodoUseCase extends Mock implements IInsertTodoUseCase {}

class MockUpdateTodoUseCase extends Mock implements IUpdateTodoUseCase {}

class MockDeleteTodoUseCase extends Mock implements IDeleteTodoUseCase {}

class MockTodosSearchForm extends Mock implements TodosSearchForm {}

class MockTodoForm extends Mock implements TodoForm {}

class MockTodosBloc extends Mock implements TodosBloc {}

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  late GetIt getIt;
  late ITodoDatasource todoDatasource;
  late ITodoRepository todoRepository;
  late IGetTodoUseCase getTodoUseCase;
  late IGetAllTodosUseCase getAllTodosUseCase;
  late IInsertTodoUseCase insertTodoUseCase;
  late IUpdateTodoUseCase updateTodoUseCase;
  late IDeleteTodoUseCase deleteTodoUseCase;
  late TodoForm todoForm;
  late TodosSearchForm todosSearchForm;
  late TodosBloc todosBloc;
  late TodoBloc todoBloc;

  setUp(() {
    getIt = GetIt.instance;
    todoDatasource = MockTodoDatasource();
    todoRepository = MockTodoRepository();
    getTodoUseCase = MockGetTodoUseCase();
    getAllTodosUseCase = MockGetAllTodosUseCase();
    insertTodoUseCase = MockInsertTodoUseCase();
    updateTodoUseCase = MockUpdateTodoUseCase();
    deleteTodoUseCase = MockDeleteTodoUseCase();
    todoForm = MockTodoForm();
    todosSearchForm = MockTodosSearchForm();
    todosBloc = MockTodosBloc();
    todoBloc = MockTodoBloc();
  });

  tearDown(() {
    getIt.reset();
  });

  test('Registers all todo dependencies with getIt', () {
    TodoBinds.call(getIt: getIt);
    expect(getIt.isRegistered<ITodoDatasource>(), isTrue);
    expect(getIt.isRegistered<ITodoRepository>(), isTrue);
    expect(getIt.isRegistered<IGetTodoUseCase>(), isTrue);
    expect(getIt.isRegistered<IGetAllTodosUseCase>(), isTrue);
    expect(getIt.isRegistered<IInsertTodoUseCase>(), isTrue);
    expect(getIt.isRegistered<IUpdateTodoUseCase>(), isTrue);
    expect(getIt.isRegistered<IDeleteTodoUseCase>(), isTrue);
    expect(getIt.isRegistered<TodoForm>(), isTrue);
    expect(getIt.isRegistered<TodosSearchForm>(), isTrue);
    expect(getIt.isRegistered<TodosBloc>(), isTrue);
    expect(getIt.isRegistered<TodoBloc>(), isTrue);
  });

  test('registers all dependencies correctly', () async {
    // act
    getIt.registerSingleton<ITodoDatasource>(todoDatasource);
    getIt.registerSingleton<ITodoRepository>(todoRepository);
    getIt.registerSingleton<IGetTodoUseCase>(getTodoUseCase);
    getIt.registerSingleton<IGetAllTodosUseCase>(getAllTodosUseCase);
    getIt.registerSingleton<IInsertTodoUseCase>(insertTodoUseCase);
    getIt.registerSingleton<IUpdateTodoUseCase>(updateTodoUseCase);
    getIt.registerSingleton<IDeleteTodoUseCase>(deleteTodoUseCase);
    getIt.registerSingleton<TodoForm>(todoForm);
    getIt.registerSingleton<TodosSearchForm>(todosSearchForm);
    getIt.registerSingleton<TodosBloc>(todosBloc);
    getIt.registerSingleton<TodoBloc>(todoBloc);

    await Future.delayed(const Duration(seconds: 1));
    // assert
    expect(getIt<ITodoDatasource>(), equals(todoDatasource));
    expect(getIt<ITodoRepository>(), equals(todoRepository));
    expect(getIt<IGetTodoUseCase>(), equals(getTodoUseCase));
    expect(getIt<IGetAllTodosUseCase>(), equals(getAllTodosUseCase));
    expect(getIt<IInsertTodoUseCase>(), equals(insertTodoUseCase));
    expect(getIt<IUpdateTodoUseCase>(), equals(updateTodoUseCase));
    expect(getIt<IDeleteTodoUseCase>(), equals(deleteTodoUseCase));
    expect(getIt<TodoForm>(), equals(todoForm));
    expect(getIt<TodosSearchForm>(), equals(todosSearchForm));
    expect(getIt<TodosBloc>(), equals(todosBloc));
    expect(getIt<TodoBloc>(), equals(todoBloc));
  });
}
