part of 'todos_bloc.dart';

abstract class TodosEvent {
  const TodosEvent();
}

class InitTodosEvent extends TodosEvent {}

class GetAllTodosEvent extends TodosEvent {
  final FilterTodos filter;

  const GetAllTodosEvent({required this.filter});
}

class SearchTodosEvent extends TodosEvent {
  final String searchValue;

  const SearchTodosEvent({required this.searchValue});
}
