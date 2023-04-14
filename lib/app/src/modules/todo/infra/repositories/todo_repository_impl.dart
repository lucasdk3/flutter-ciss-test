import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

class TodoRepositoryImpl extends ITodoRepository {
  final ITodoDatasource _datasource;

  TodoRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, TodoEntity>> get({required int id}) async {
    try {
      final result = await _datasource.get(id: id);
      return right(result.toEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getAll({required FilterTodos filterTodos}) async {
    try {
      final result = await _datasource.getAll(filterTodos:filterTodos);
      final todos = List<TodoEntity>.from(result.map((todo) => todo.toEntity));
      return right(todos);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> insert(
      {required TodoEntity todoEntity}) async {
    try {
      final result = await _datasource.insert(todoModel: todoEntity.toModel);
      return right(result.toEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> update(
      {required TodoEntity todoEntity}) async {
    try {
      final result = await _datasource.update(todoModel: todoEntity.toModel);
      return right(result.toEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, SuccessResponse>> delete({required int id}) async {
    try {
      final result = await _datasource.delete(id: id);
      return right(result);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
