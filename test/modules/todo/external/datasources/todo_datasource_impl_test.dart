import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

class MockApiService extends Mock implements IApiService {}

void main() {
  group('TodoDatasourceImpl', () {
    late TodoDatasourceImpl datasource;
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      datasource = TodoDatasourceImpl(mockApiService);
    });

    test('get should return a TodoModel when the response is successful',
        () async {
      // Arrange
      const id = 1;
      final responseBody = {'id': id, 'title': 'Todo 1'};
      final response = ApiResponse<Map<String, dynamic>>(
        body: responseBody,
        statusCode: 200,
      );
      when(() => mockApiService.get(apiRequest: any(named: 'apiRequest')))
          .thenAnswer((_) async => response);

      // Act
      final result = await datasource.get(id: id);

      // Assert
      expect(result, isA<TodoModel>());
      expect(result.id, id);
      expect(result.title, responseBody['title']);
    });

    test(
        'get should throw an ErrorResponse when the response is not successful',
        () async {
      // Arrange
      const id = 1;
      const response = ApiResponse<Map<String, dynamic>>(
        body: {'message': 'Error'},
        statusCode: 400,
      );
      when(() => mockApiService.get(apiRequest: any(named: 'apiRequest')))
          .thenAnswer((_) async => response);

      // Act
      final call = datasource.get;

      // Assert
      expect(() => call(id: id), throwsA(isA<ErrorResponse>()));
    });
  });
}
