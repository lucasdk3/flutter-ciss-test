import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../ciss_test_exports.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final IGetAllTodosUseCase getAllUseCase;
  TodosBloc({required this.getAllUseCase})
      : super(const TodosInitial(todos: [])) {
    on<GetAllTodosEvent>((event, emit) async {
      emit(TodosLoading(todos: state.todos));
      final result = await getAllUseCase.call();
      result.fold(
          (failure) => emit(TodosError(todos: state.todos, failure: failure)),
          (success) => (success.isEmpty)
              ? emit(const TodosEmpty(todos: []))
              : emit(TodosSuccess(todos: success)));
    });
  }
}
