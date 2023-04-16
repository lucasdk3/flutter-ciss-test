// coverage:ignore-file
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class GetDefaultTimezone {
  static Future<String?> call() async {
    try {
      final timezone = await FlutterNativeTimezone.getLocalTimezone();
      return timezone;
    } catch (e) {
      debugPrint('Could not get the local timezone');
      return null;
    }
  }
}
