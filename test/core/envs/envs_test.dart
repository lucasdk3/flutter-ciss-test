import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';

void main() {
  group('EnvironmentServer', () {
    test(
        'fromLocalEnv should return a default environment if the "env" environment variable is not set',
        () {
      final environmentServer = EnvironmentServer.fromLocalEnv();
      expect(environmentServer.env, equals(Environment.dev));
    });

    test(
        'fromLocalEnv should return the correct environment based on the "env" environment variable',
        () {
      const expectedEnvironment = Environment.dev;
      const testEnvironment = 'dev';
      final environmentServer = EnvironmentServer.fromLocalEnv();

      // Set the "env" environment variable to the test environment
      const String.fromEnvironment('env', defaultValue: testEnvironment);

      expect(environmentServer.env, equals(expectedEnvironment));
    });
  });
}
