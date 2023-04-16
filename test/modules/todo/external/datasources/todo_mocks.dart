import 'package:flutter_ciss_test/ciss_test_exports.dart';

class TodoMocksTest {
  static const id = 1;
  static const todoModel =
      TodoModel(id: id, title: 'Todo 1', completed: false, userId: 1);
  static const todoModel2 =
      TodoModel(id: 2, title: 'Todo 2', completed: true, userId: 1);
  static final todoModels = [todoModel, todoModel2];
  static const todoEntity =
      TodoEntity(id: 1, title: 'Todo 1', completed: false, userId: 1);
  static const todoEntity2 =
      TodoEntity(id: 2, title: 'Todo 2', completed: false, userId: 1);
  static final todoEntities = [todoEntity, todoEntity2];
  static const todoJson = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  };

  static const todoModelFromJson = TodoModel(
      id: 1, title: 'delectus aut autem', completed: false, userId: 1);

  static const todosJson = [
    {"id": 1, "userId": 1, "title": "Teste 1", "completed": false},
    {"id": 2, "userId": 1, "title": "Teste 2", "completed": true},
    {"id": 3, "userId": 1, "title": "Teste 3", "completed": false}
  ];

  static const errorResponse =
      ErrorResponse(message: 'Error in todo', statusCode: '400');

  static const errorJson = ApiResponse<Map<String, dynamic>>(
    errorBody: {'message': 'Error'},
    statusCode: 400,
  );
}
