import 'package:dartz/dartz.dart';

import '../../../../../../../ciss_test_exports.dart';

abstract class IDeleteTodoUseCase {
  Future<Either<Failure, SuccessResponse>> call({required int id});
}

class DeleteTodoUseCaseImpl extends IDeleteTodoUseCase {
  final ITodoRepository _repository;

  DeleteTodoUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, SuccessResponse>> call({required int id}) async =>
      await _repository.delete(id: id);
}
