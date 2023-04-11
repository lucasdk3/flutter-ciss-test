part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  final List<TodoEntity> todos;
  const TodosState({required this.todos});

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {
  const TodosInitial({required super.todos});
}

class TodosLoading extends TodosState {
  const TodosLoading({required super.todos});
}

class TodosError extends TodosState {
  final Failure failure;
  const TodosError({required this.failure, required super.todos});
}

class TodosSuccess extends TodosState {
  const TodosSuccess({required super.todos});
}

class TodosEmpty extends TodosState {
  const TodosEmpty({required super.todos});
}
