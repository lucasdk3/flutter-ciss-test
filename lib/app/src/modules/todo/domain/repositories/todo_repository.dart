import 'package:flutter_ciss_test/ciss_test_exports.dart';
import 'package:dartz/dartz.dart';

abstract class ITodoRepository {
  Future<Either<Failure, List<TodoEntity>>> getAll();
  Future<Either<Failure, TodoEntity>> get({required int id});
  Future<Either<Failure, TodoEntity>> insert({required TodoEntity todoEntity});
  Future<Either<Failure, TodoEntity>> update({required TodoEntity todoEntity});
  Future<Either<Failure, SuccessResponse>> delete({required int id});
}
