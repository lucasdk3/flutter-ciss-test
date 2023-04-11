import '../../../../../../../ciss_test_exports.dart';

abstract class ITodoDatasource {
  Future<List<TodoModel>> getAll();
  Future<TodoModel> get({required int id});
  Future<TodoModel> insert({required TodoModel todoModel});
  Future<TodoModel> update({required TodoModel todoModel});
  Future<SuccessResponse> delete({required int id});
}
