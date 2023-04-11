import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../ciss_test_exports.dart';

class App extends StatelessWidget {
  final Environment env;
  const App({Key? key, required this.env}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    AppBinds.call(getIt: getIt, env: env);
    final routes = AppRoutes.routes(getIt);

    return MaterialApp.router(
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      routerDelegate: routes.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Teste técnico CISS',
    );
  }
}
