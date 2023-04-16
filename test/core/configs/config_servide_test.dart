import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

class MockEnvironmentService extends IEnvironmentService {
  @override
  Environment env = Environment.dev;
}

void main() {
  group('ConfigsService', () {
    late ConfigsService configsService;

    setUp(() {
      final mockEnvironmentService = MockEnvironmentService();
      configsService =
          ConfigsService(environmentServer: mockEnvironmentService);
    });

    test('BaseUrl should return the correct URL', () {
      expect(configsService.baseUrl,
          equals('https://jsonplaceholder.typicode.com'));
    });
  });
}
