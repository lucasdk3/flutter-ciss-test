import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

abstract class IUpdateTodoUseCase {
  Future<Either<Failure, TodoEntity>> call({required TodoEntity todoEntity});
}

class UpdateTodoUseCaseImpl extends IUpdateTodoUseCase {
  final ITodoRepository _repository;

  UpdateTodoUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, TodoEntity>> call(
          {required TodoEntity todoEntity}) async =>
      await _repository.update(todoEntity: todoEntity);
}
