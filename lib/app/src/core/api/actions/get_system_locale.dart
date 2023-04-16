// coverage:ignore-file
import 'dart:ui';

class GetSystemLocale {
  static String call() {
    final Locale systemLocales = window.locale;
    final formattedLocale =
        systemLocales.toString().replaceAll('_', '-').toLowerCase();
    return formattedLocale;
  }
}
