import '../../../../../../ciss_test_exports.dart';

class TodoRequests {
  static ApiRequest getAll() =>
      ApiRequest(path: '/todos', mockSimulate: TodoResponses.successResponse);
  static ApiRequest get({required int id}) => ApiRequest(
      path: '/todos/$id', mockSimulate: TodoResponses.successResponse);
  static ApiRequest insert({required Map<String, dynamic> data}) => ApiRequest(
      path: '/todos', body: data, mockSimulate: TodoResponses.successResponse);
  static ApiRequest update({required Map<String, dynamic> data}) => ApiRequest(
      path: '/todos/${data['id']}',
      body: data,
      mockSimulate: TodoResponses.successResponse);
  static ApiRequest delete({required int id}) => ApiRequest(
      path: '/todos/$id', mockSimulate: TodoResponses.successResponse);
}

class TodoResponses {
  static ApiResponse successResponse = const ApiResponse(
    body: TodoMocks.successResponse,
    statusCode: 200,
  );

  static ApiResponse errorResponse = const ApiResponse(
    body: TodoMocks.errorResponse,
    statusCode: 500,
  );
}
