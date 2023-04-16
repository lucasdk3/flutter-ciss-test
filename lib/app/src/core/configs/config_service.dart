import '../../../../ciss_test_exports.dart';

abstract class IConfigsService {
  late String baseUrl;
  late String token;
  late String debugmode;
  late String timeOut;
}

class ConfigsService extends IConfigsService {
  final IEnvironmentService environmentServer;

  ConfigsService({required this.environmentServer});

  @override
  String get baseUrl {
    switch (environmentServer.env) {
      case Environment.prod:
        return 'https://jsonplaceholder.typicode.com';
      case Environment.qa:
        return 'https://jsonplaceholder.typicode.com';
      case Environment.dev:
        return 'https://jsonplaceholder.typicode.com';
      default:
        return 'https://jsonplaceholder.typicode.com';
    }
  }
}
