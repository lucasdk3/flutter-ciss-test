part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodosEvent extends TodosEvent {}

class GetTodosEvent {
  final int id;

  GetTodosEvent({required this.id});
}

class DeleteTodosEvent extends TodosEvent {
  final int id;

  DeleteTodosEvent({required this.id});
}
