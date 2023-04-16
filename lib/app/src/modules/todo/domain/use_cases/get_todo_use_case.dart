import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

abstract class IGetTodoUseCase {
  Future<Either<Failure, TodoEntity>> call({required int id});
}

class GetTodoUseCaseImpl extends IGetTodoUseCase {
  final ITodoRepository _repository;

  GetTodoUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, TodoEntity>> call({required int id}) async =>
      await _repository.get(id: id);
}
