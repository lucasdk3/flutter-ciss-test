import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../ciss_test_exports.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final IGetTodoUseCase getUseCase;
  final IInsertTodoUseCase insertUseCase;
  final IUpdateTodoUseCase updateUseCase;
  final IDeleteTodoUseCase deleteUseCase;
  final TodoForm form;

  TodoBloc({
    required this.getUseCase,
    required this.insertUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
    required this.form,
  }) : super(TodoInitial()) {
    on<SetFormTodoEvent>((event, emit) {
      final todoEntity = event.todoEntity ?? const TodoEntity();
      form.setTodo(todoEntity);
    });
    on<SubmitInsertTodoEvent>((event, emit) async {
      emit(TodoLoading());
      final todoEntity = form.toEntity();

      final result = await insertUseCase.call(todoEntity: todoEntity);
      result.fold((failure) => emit(TodoError(failure: failure)),
          (success) => emit(TodoSuccess()));
    });
    on<SubmitUpdateTodoEvent>((event, emit) async {
      emit(TodoLoading());
      final todoEntity = form.toEntity();

      final result = await updateUseCase.call(todoEntity: todoEntity);
      result.fold((failure) => emit(TodoError(failure: failure)),
          (success) => emit(TodoSuccess()));
    });
    on<SubmitDeleteTodoEvent>((event, emit) async {
      emit(TodoLoading());

      final result = await deleteUseCase.call(id: event.id);
      result.fold((failure) => emit(TodoError(failure: failure)),
          (success) => emit(TodoSuccess()));
    });
    on<SubmitCompletedTodoEvent>((event, emit) async {
      emit(TodoLoading());
      final todoEntity = event.todoEntity;

      final result = await updateUseCase.call(todoEntity: todoEntity);
      result.fold((failure) => emit(TodoError(failure: failure)),
          (success) => emit(TodoSuccess()));
    });
    on<ResetTodoEvent>((event, emit) async {
      emit(TodoInitial());
    });
  }
}
