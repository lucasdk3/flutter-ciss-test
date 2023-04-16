enum Environment { dev, qa, prod }

abstract class IEnvironmentService {
  Environment get env => throw UnimplementedError();
}

class EnvironmentServer implements IEnvironmentService {
  final Environment _env;

  const EnvironmentServer(this._env);

  factory EnvironmentServer.fromLocalEnv() {
    final map = <String, Environment>{
      'dev': Environment.dev,
      'qa': Environment.qa,
      'prod': Environment.prod
    };

    return EnvironmentServer(
        map[const String.fromEnvironment('env', defaultValue: 'dev')] ??
            Environment.dev);
  }

  @override
  Environment get env => _env;
}
