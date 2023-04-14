import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ciss_test_exports.dart';

class ThemeStyles {
  TextStyle ralewayTitle({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.raleway(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 42,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.black,
    );
  }

  TextStyle ralewaySubtitle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.raleway(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 20,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.black,
    );
  }

  TextStyle ralewayButton(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.raleway(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 20,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.black,
    );
  }

  TextStyle ralewayBody({Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.raleway(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 16,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.black,
    );
  }

  TextStyle ralewayHelper(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.raleway(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 12,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.secondary,
    );
  }

  TextStyle ralewayDanger(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return GoogleFonts.raleway(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 12,
      fontStyle: FontStyle.normal,
      color: color ?? ThemeService.colors.danger,
    );
  }

  ButtonStyle segmentedStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return ThemeService.colors.primary;
            }
            return ThemeService.colors.white;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return ThemeService.colors.white;
            }
            return ThemeService.colors.primary;
          },
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        textStyle:
            MaterialStateProperty.all(ThemeService.styles.ralewayHelper()));
  }
}
