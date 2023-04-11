import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ciss_test_exports.dart';

class ThemeStyles {
  TextStyle montserratBody(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.textPrimary,
    );
  }
}
