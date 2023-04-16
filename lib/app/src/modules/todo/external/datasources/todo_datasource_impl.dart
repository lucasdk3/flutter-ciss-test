import '../../../../../../ciss_test_exports.dart';

class TodoDatasourceImpl extends ITodoDatasource {
  final IApiService _api;

  TodoDatasourceImpl(this._api);
  @override
  Future<TodoModel> get({required int id}) async {
    final response = await _api.get(apiRequest: TodoRequests.get(id: id));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ErrorResponse(
          statusCode: (response.statusCode ?? 404).toString(),
          message: response.errorBody?['message'] ?? ConstantsStrings.error404);
    } else {
      final body = response.body as Map<String, dynamic>;
      final find = TodoModel.fromJson(body);
      return find;
    }
  }

  @override
  Future<List<TodoModel>> getAll({required FilterTodos filterTodos}) async {
    final response = await _api.get(
        apiRequest: TodoRequests.getAll(filterTodos: filterTodos));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ErrorResponse(
          statusCode: (response.statusCode ?? 404).toString(),
          message: response.errorBody?['message'] ?? ConstantsStrings.error404);
    } else {
      final body = response.body as List;
      final todos = List<TodoModel>.from(
          body.map((interest) => TodoModel.fromJson(interest)));
      return todos;
    }
  }

  @override
  Future<TodoModel> insert({required TodoModel todoModel}) async {
    final response = await _api.post(
        apiRequest: TodoRequests.insert(data: todoModel.toJson()));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ErrorResponse(
          statusCode: (response.statusCode ?? 404).toString(),
          message: response.errorBody?['message'] ?? ConstantsStrings.error404);
    } else {
      final body = response.body as List;
      final find = TodoModel.fromJson(body.first);
      return find;
    }
  }

  @override
  Future<TodoModel> update({required TodoModel todoModel}) async {
    final response = await _api.patch(
        apiRequest: TodoRequests.update(data: todoModel.toJson()));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ErrorResponse(
          statusCode: (response.statusCode ?? 404).toString(),
          message: response.errorBody?['message'] ?? ConstantsStrings.error404);
    } else {
      final body = response.body as Map<String, dynamic>;
      final find = TodoModel.fromJson(body);
      return find;
    }
  }

  @override
  Future<SuccessResponse> delete({required int id}) async {
    final response = await _api.delete(apiRequest: TodoRequests.delete(id: id));
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw ErrorResponse(
          statusCode: (response.statusCode ?? 404).toString(),
          message: response.errorBody?['message'] ?? ConstantsStrings.error404);
    } else {
      return SuccessResponse(value: "Deletado item com sucesso");
    }
  }
}
