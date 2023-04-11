import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import '../ciss_test_exports.dart';

class AppRoutes {
  static GoRouter routes(GetIt getIt) =>
      GoRouter(initialLocation: '/', routes: <GoRoute>[
        GoRoute(
            path: ConstantsRoutes.root,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            }),
      ]);
}
