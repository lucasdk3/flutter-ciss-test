import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../ciss_test_exports.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final IGetAllTodosUseCase getAllUseCase;
  final TodosSearchForm searchForm;

  TodosBloc({required this.getAllUseCase, required this.searchForm})
      : super(const TodosInitial(
            todos: [], searchedTodos: [], filter: FilterTodos.all)) {
    on<InitTodosEvent>((event, emit) async {
      final Debouncer debouncer = Debouncer(milliseconds: 500);
      searchForm.formGroup
          .control(ConstantsForms.search)
          .valueChanges
          .listen((event) {
        final searchValue = event as String;
        debouncer(() => add(SearchTodosEvent(searchValue: searchValue)));
      });
      add(const GetAllTodosEvent(filter: FilterTodos.all));
    });

    on<GetAllTodosEvent>((event, emit) async {
      emit(TodosLoading(
          todos: state.todos,
          searchedTodos: state.searchedTodos,
          filter: event.filter));
      final result = await getAllUseCase.call(filterTodos: event.filter);
      result.fold(
          (failure) => emit(TodosError(
              todos: state.todos,
              searchedTodos: const [],
              failure: failure,
              filter: event.filter)),
          (success) => (success.isEmpty)
              ? emit(TodosEmpty(
                  todos: const [],
                  searchedTodos: const [],
                  filter: event.filter))
              : emit(TodosSuccess(
                  todos: success,
                  searchedTodos: const [],
                  filter: event.filter)));
    });

    on<SearchTodosEvent>((event, emit) async {
      emit(TodosLoading(
          todos: state.todos, searchedTodos: const [], filter: state.filter));
      final todos = state.todos;
      final todosSearched = todos
          .where((todo) => (todo.title ?? '')
              .toLowerCase()
              .contains(event.searchValue.toLowerCase()))
          .toList();
      emit(TodosSuccess(
          todos: todos, searchedTodos: todosSearched, filter: state.filter));
    });
  }
}
