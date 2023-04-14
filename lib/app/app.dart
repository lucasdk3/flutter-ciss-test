import 'package:flutter/material.dart';
import '../ciss_test_exports.dart';

class App extends StatelessWidget {
  final Environment env;
  const App({Key? key, required this.env}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final routes = AppRoutes.routes();

    return MaterialApp.router(
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      routerDelegate: routes.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Teste técnico CISS',
    );
  }
}
