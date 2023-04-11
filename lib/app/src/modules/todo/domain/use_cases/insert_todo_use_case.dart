import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

abstract class IInsertTodoUseCase {
  Future<Either<Failure, TodoEntity>> call({required TodoEntity todoEntity});
}

class InsertTodoUseCaseImpl extends IInsertTodoUseCase {
  final ITodoRepository _repository;

  InsertTodoUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, TodoEntity>> call(
          {required TodoEntity todoEntity}) async =>
      await _repository.insert(todoEntity: todoEntity);
}
