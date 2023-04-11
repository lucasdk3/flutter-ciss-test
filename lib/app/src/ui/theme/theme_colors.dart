import 'package:flutter/material.dart';

class ThemeColors {
  Color get primary => const Color(0xFF17930D);
  Color get secondary => const Color(0xFF9dc59b);
  Color get terciary => const Color(0xFFDEDFE0);
  Color get white => const Color(0xFFEEEDEE);
  Color get iconPrimary => const Color(0xFF0E3613);
  Color get iconSecondary => const Color(0xFF64C65C);
  Color get selectedItem => const Color(0xFF1B6425);
  Color get unselectedItem => const Color(0xFF17930D);
  Color get buttonPrimary => const Color(0xFF0E3613);
  Color get border => const Color(0xFF717F7F);
  Color get textPrimary => const Color(0xFF0E3613);
  Color get textSecondary => const Color(0xFFCDCDCD);
  Color get textTerciary => const Color(0xFF717F7F);
  Color get textPagination => const Color(0xFF535455);
  Color get textWhite => const Color(0xFFEEEDEE);
  Color get danger => const Color(0xFF972006);
  Color get background => const Color(0xFF0E3613);
  Color get textQuarter => const Color(0xFF1B6425);
  Color get textTitle => const Color(0xFF494A4A);
  Color get crud => const Color(0xFFDEDFE0);
  Color get borderPrimary => const Color(0xFF066B30);
  Color get borderSecondary => const Color(0xFF64C65C);
  Color get interestItem => const Color.fromRGBO(14, 54, 19, 0.14);
  BoxShadow get boxShadow => const BoxShadow(
        color: Color(0x0F707a85),
        offset: Offset(0, 5),
        blurRadius: 7,
      );

  LinearGradient get backgroundGradient => const LinearGradient(colors: [
        Color(0xFF0E3613),
        Color(0xFF1B6425),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
