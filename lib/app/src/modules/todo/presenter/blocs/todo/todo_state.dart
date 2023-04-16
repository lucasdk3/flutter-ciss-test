part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoError extends TodoState {
  final Failure failure;

  const TodoError({required this.failure});
}

class TodoSuccess extends TodoState {}
