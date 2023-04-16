// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import '../ciss_test_exports.dart';

class AppRoutes {
  static GoRouter routes() => GoRouter(initialLocation: '/', routes: <GoRoute>[
        GoRoute(
            path: ConstantsRoutes.root,
            builder: (BuildContext context, GoRouterState state) {
              return const SplashPage();
            }),
        GoRoute(
            path: ConstantsRoutes.todos,
            builder: (BuildContext context, GoRouterState state) {
              return const TodosPage();
            },
            routes: [
              GoRoute(
                  path: ConstantsRoutes.todo,
                  builder: (BuildContext context, GoRouterState state) {
                    final isEdit = state.queryParams['isEdit'] == 'true';
                    final todo = state.extra as TodoEntity?;
                    return TodoPage(todoEntity: todo, isEdit: isEdit);
                  }),
            ]),
      ]);
}
