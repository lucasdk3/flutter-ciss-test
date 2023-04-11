
import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

abstract class IGetAllTodosUseCase {
  Future<Either<Failure, List<TodoEntity>>> call();
}

class GetAllTodosUseCaseImpl extends IGetAllTodosUseCase {
  final ITodoRepository _repository;

  GetAllTodosUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, List<TodoEntity>>> call() async =>
      await _repository.getAll();
}
