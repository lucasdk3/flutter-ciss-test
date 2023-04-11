import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic>? _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getUrlBase() {
    return _config!['urlBase'] as String;
  }

  static String getToken() {
    return _config!['token'] as String;
  }

  static bool getDebugMode() {
    return _config!['debugMode'] as bool;
  }

  static String getAppTitle() {
    return _config!['appTitle'] as String;
  }
}
