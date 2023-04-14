part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class SetFormTodoEvent extends TodoEvent {
  final TodoEntity? todoEntity;

  const SetFormTodoEvent({this.todoEntity});
}

class SubmitInsertTodoEvent extends TodoEvent {}

class SubmitUpdateTodoEvent extends TodoEvent {}

class ResetTodoEvent extends TodoEvent {}

class SubmitDeleteTodoEvent extends TodoEvent {
  final int id;

  const SubmitDeleteTodoEvent({required this.id});
}

class SubmitCompletedTodoEvent extends TodoEvent {
  final TodoEntity todoEntity;

  const SubmitCompletedTodoEvent({required this.todoEntity});
}
