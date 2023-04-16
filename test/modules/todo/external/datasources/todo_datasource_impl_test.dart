import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';
import '../../external/datasources/todo_mocks.dart';

class MockApiService extends Mock implements IApiService {}

class ApiRequestFake extends Fake implements ApiRequest {}

void main() {
  group('TodoDatasourceImpl', () {
    late TodoDatasourceImpl datasource;
    late MockApiService mockApiService;

    setUp(() {
      registerFallbackValue(ApiRequestFake());
      mockApiService = MockApiService();
      datasource = TodoDatasourceImpl(mockApiService);
    });

    group('Get', () {
      test('get should return a TodoModel when the response is successful',
          () async {
        // Arrange
        const responseBody = TodoMocksTest.todoJson;
        const response = ApiResponse<Map<String, dynamic>>(
          body: responseBody,
          statusCode: 200,
        );
        when(() => mockApiService.get(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => response);

        // Act
        final result = await datasource.get(id: TodoMocksTest.id);

        // Assert
        expect(result, isA<TodoModel>());
        expect(result.id, TodoMocksTest.id);
        expect(result.title, responseBody['title']);
      });

      test(
          'get should throw an ErrorResponse when the response is not successful',
          () async {
        // Arrange

        when(() => mockApiService.get(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => TodoMocksTest.errorJson);

        // Act
        final call = datasource.get;

        // Assert
        expect(() => call(id: TodoMocksTest.id), throwsException);
      });
    });

    group('GetAll', () {
      test(
          'get should return a List<TodoModel> when the response is successful',
          () async {
        // Arrange
        const responseBody = TodoMocksTest.todosJson;
        const response = ApiResponse<List>(
          body: responseBody,
          statusCode: 200,
        );
        when(() => mockApiService.get(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => response);

        // Act
        final result = await datasource.getAll(filterTodos: FilterTodos.all);

        // Assert
        expect(result, isA<List<TodoModel>>());
      });

      test(
          'get should throw an ErrorResponse when the response is not successful',
          () async {
        // Arrange
        when(() => mockApiService.get(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => TodoMocksTest.errorJson);

        // Act
        final call = datasource.getAll;

        // Assert
        expect(() => call(filterTodos: FilterTodos.all), throwsException);
      });
    });

    group('Insert', () {
      test('post should return a TodoModel when the response is successful',
          () async {
        // Arrange
        const responseBody = TodoMocksTest.todosJson;
        const response = ApiResponse<List>(
          body: responseBody,
          statusCode: 200,
        );

        when(() => mockApiService.post(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => response);

        // Act
        final result =
            await datasource.insert(todoModel: TodoMocksTest.todoModelFromJson);

        // Assert
        expect(result, isA<TodoModel>());
      });

      test(
          'post should throw an ErrorResponse when the response is not successful',
          () async {
        // Arrange

        when(() => mockApiService.post(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => TodoMocksTest.errorJson);

        // Assert
        expect(() => datasource.insert(todoModel: TodoMocksTest.todoModel),
            throwsException);
      });
    });

    group('Update', () {
      test('patch should return a TodoModel when the response is successful',
          () async {
        // Arrange
        const responseBody = TodoMocksTest.todoJson;
        const response = ApiResponse<Map<String, dynamic>>(
          body: responseBody,
          statusCode: 200,
        );

        when(() => mockApiService.patch(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => response);

        // Act
        final result =
            await datasource.update(todoModel: TodoMocksTest.todoModelFromJson);

        // Assert
        expect(result, isA<TodoModel>());
      });

      test(
          'patch should throw an ErrorResponse when the response is not successful',
          () async {
        // Arrange

        when(() => mockApiService.patch(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => TodoMocksTest.errorJson);

        // Assert
        expect(() => datasource.update(todoModel: TodoMocksTest.todoModel),
            throwsException);
      });
    });

    group('Delete', () {
      test('delete should return a TodoModel when the response is successful',
          () async {
        // Arrange
        const response = ApiResponse<Map<String, dynamic>>(
          statusCode: 200,
        );

        when(() => mockApiService.delete(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => response);

        // Act
        final result = await datasource.delete(id: TodoMocksTest.id);

        // Assert
        expect(result, isA<SuccessResponse>());
      });

      test(
          'delete should throw an ErrorResponse when the response is not successful',
          () async {
        // Arrange

        when(() => mockApiService.delete(apiRequest: any(named: 'apiRequest')))
            .thenAnswer((_) async => TodoMocksTest.errorJson);

        // Assert
        expect(() => datasource.delete(id: TodoMocksTest.id), throwsException);
      });
    });
  });
}
