import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../ciss_test_exports.dart';

class AppBinds {
  static void call({required GetIt getIt, required Environment env}) {
    getIt.registerSingleton(Dio());
    getIt.registerSingleton<IEnvironmentService>(
        EnvironmentServer.fromLocalEnv());
    getIt.registerSingleton<IConfigsService>(
        ConfigsService(environmentServer: getIt.get<IEnvironmentService>()));
    getIt.registerSingleton<IStorageService>(StorageService());
    getIt.registerSingleton<IApiService>(ApiService(
      getIt<Dio>(),
      getIt<IConfigsService>(),
      getIt<IStorageService>(),
    ));
  }
}
