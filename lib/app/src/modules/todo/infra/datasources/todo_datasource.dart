import '../../../../../../../ciss_test_exports.dart';

abstract class ITodoDatasource {
  Future<List<TodoModel>> getAll({required FilterTodos filterTodos});
  Future<TodoModel> get({required int id});
  Future<TodoModel> insert({required TodoModel todoModel});
  Future<TodoModel> update({required TodoModel todoModel});
  Future<SuccessResponse> delete({required int id});
}
