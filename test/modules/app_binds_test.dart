import 'package:dio/dio.dart';
import 'package:flutter_ciss_test/ciss_test_exports.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockEnvironmentService extends Mock implements IEnvironmentService {}

class MockConfigsService extends Mock implements IConfigsService {}

class MockStorageService extends Mock implements IStorageService {}

class MockApiService extends Mock implements IApiService {}

void main() {
  late GetIt getIt;
  late Dio dio;
  late IEnvironmentService environmentService;
  late IConfigsService configsService;
  late IStorageService storageService;
  late IApiService apiService;

  setUp(() {
    getIt = GetIt.instance;
    dio = MockDio();
    environmentService = MockEnvironmentService();
    configsService = MockConfigsService();
    storageService = MockStorageService();
    apiService = MockApiService();
  });

  tearDown(() {
    getIt.reset();
  });

  test('registers all dependencies correctly', () {
    // arrange
    getIt.registerSingleton<IEnvironmentService>(environmentService);
    getIt.registerSingleton<IConfigsService>(configsService);
    getIt.registerSingleton<IStorageService>(storageService);
    getIt.registerSingleton<Dio>(dio);
    getIt.registerSingleton<IApiService>(apiService);

    // assert
    expect(getIt<Dio>(), equals(dio));
    expect(getIt<IEnvironmentService>(), equals(environmentService));
    expect(getIt<IConfigsService>(), equals(configsService));
    expect(getIt<IStorageService>(), equals(storageService));
    expect(getIt<IApiService>(), equals(apiService));
  });

  test('Registers app dependencies with getIt', () {
    AppBinds.call(getIt: getIt, env: Environment.dev);
    expect(getIt.isRegistered<Dio>(), isTrue);
    expect(getIt.isRegistered<IEnvironmentService>(), isTrue);
    expect(getIt.isRegistered<IConfigsService>(), isTrue);
    expect(getIt.isRegistered<IStorageService>(), isTrue);
    expect(getIt.isRegistered<IApiService>(), isTrue);
  });
}
