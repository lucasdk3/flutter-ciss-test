
import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

abstract class IGetAllTodosUseCase {
  Future<Either<Failure, List<TodoEntity>>> call({required FilterTodos filterTodos});
}

class GetAllTodosUseCaseImpl extends IGetAllTodosUseCase {
  final ITodoRepository _repository;

  GetAllTodosUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, List<TodoEntity>>> call({required FilterTodos filterTodos}) async =>
      await _repository.getAll(filterTodos:filterTodos);
}
