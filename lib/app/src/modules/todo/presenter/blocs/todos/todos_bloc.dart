import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../ciss_test_exports.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final IGetAllTodosUseCase getAllUseCase;

  TodosBloc({required this.getAllUseCase})
      : super(const TodosInitial(todos: [], filter: FilterTodos.all)) {
    on<GetAllTodosEvent>((event, emit) async {
      emit(TodosLoading(todos: state.todos, filter: event.filter));
      final result = await getAllUseCase.call(filterTodos: event.filter);
      result.fold(
          (failure) => emit(TodosError(
              todos: state.todos, failure: failure, filter: event.filter)),
          (success) => (success.isEmpty)
              ? emit(TodosEmpty(todos: const [], filter: event.filter))
              : emit(TodosSuccess(todos: success, filter: event.filter)));
    });
  }
}
