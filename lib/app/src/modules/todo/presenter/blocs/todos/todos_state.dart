part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  final List<TodoEntity> todos;
  final List<TodoEntity> searchedTodos;
  final FilterTodos filter;
  const TodosState(
      {required this.todos, required this.searchedTodos, required this.filter});

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {
  const TodosInitial(
      {required super.todos,
      required super.searchedTodos,
      required super.filter});
}

class TodosLoading extends TodosState {
  const TodosLoading(
      {required super.todos,
      required super.searchedTodos,
      required super.filter});
}

class TodosError extends TodosState {
  final Failure failure;
  const TodosError(
      {required this.failure,
      required super.todos,
      required super.searchedTodos,
      required super.filter});
}

class TodosSuccess extends TodosState {
  const TodosSuccess(
      {required super.todos,
      required super.searchedTodos,
      required super.filter});
}

class TodosEmpty extends TodosState {
  const TodosEmpty(
      {required super.todos,
      required super.searchedTodos,
      required super.filter});
}
