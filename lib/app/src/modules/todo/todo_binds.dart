// coverage:ignore-file
import 'package:get_it/get_it.dart';
import '../../../../ciss_test_exports.dart';

class TodoBinds {
  static void call({required GetIt getIt}) {
    getIt.registerLazySingleton<ITodoDatasource>(
        () => TodoDatasourceImpl(getIt<IApiService>()));
    getIt.registerLazySingleton<ITodoRepository>(
        () => TodoRepositoryImpl(getIt<ITodoDatasource>()));
    getIt.registerLazySingleton<IGetTodoUseCase>(
        () => GetTodoUseCaseImpl(getIt<ITodoRepository>()));
    getIt.registerLazySingleton<IGetAllTodosUseCase>(
        () => GetAllTodosUseCaseImpl(getIt<ITodoRepository>()));
    getIt.registerLazySingleton<IInsertTodoUseCase>(
        () => InsertTodoUseCaseImpl(getIt<ITodoRepository>()));
    getIt.registerLazySingleton<IUpdateTodoUseCase>(
        () => UpdateTodoUseCaseImpl(getIt<ITodoRepository>()));
    getIt.registerLazySingleton<IDeleteTodoUseCase>(
        () => DeleteTodoUseCaseImpl(getIt<ITodoRepository>()));

    getIt.registerLazySingleton(() => TodoForm());
    getIt.registerLazySingleton(() => TodosSearchForm());
    getIt.registerLazySingleton(() => TodosBloc(
        getAllUseCase: getIt<IGetAllTodosUseCase>(),
        searchForm: getIt<TodosSearchForm>())
      ..add(InitTodosEvent()));
    getIt.registerLazySingleton(() => TodoBloc(
          form: getIt<TodoForm>(),
          getUseCase: getIt<IGetTodoUseCase>(),
          insertUseCase: getIt<IInsertTodoUseCase>(),
          updateUseCase: getIt<IUpdateTodoUseCase>(),
          deleteUseCase: getIt<IDeleteTodoUseCase>(),
        ));
  }
}
