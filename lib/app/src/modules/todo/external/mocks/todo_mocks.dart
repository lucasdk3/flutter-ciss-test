class TodoMocks {
  static const Map<String, dynamic> successResponse = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  };

  static const Map<String, dynamic> errorResponse = {
    "error": {"message": "error", "details": "error"}
  };
}
