import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'ciss_test_exports.dart';

void mainApp(Environment env) async {
  final getIt = GetIt.I;
  AppBinds.call(getIt: getIt, env: env);
  return runApp(App(env: env));
}
