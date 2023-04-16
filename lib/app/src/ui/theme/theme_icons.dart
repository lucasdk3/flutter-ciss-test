// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../ciss_test_exports.dart';

class ThemeIcons {
  SvgPicture get backIcon => SvgPicture.asset(
        'assets/icons/back_icon.svg',
        colorFilter:
            ColorFilter.mode(ThemeService.colors.primary, BlendMode.srcIn),
      );
  SvgPicture get checkIcon => SvgPicture.asset(
        'assets/icons/check_icon.svg',
        colorFilter:
            ColorFilter.mode(ThemeService.colors.primary, BlendMode.srcIn),
      );
  SvgPicture deleteIcon({Color? color}) => SvgPicture.asset(
        'assets/icons/delete_icon.svg',
        colorFilter: ColorFilter.mode(
            color ?? ThemeService.colors.black, BlendMode.srcIn),
      );
  SvgPicture updateIcon({Color? color}) => SvgPicture.asset(
        'assets/icons/update_icon.svg',
        colorFilter: ColorFilter.mode(
            color ?? ThemeService.colors.black, BlendMode.srcIn),
      );
  SvgPicture get searchIcon => SvgPicture.asset(
        'assets/icons/search_icon.svg',
        colorFilter:
            ColorFilter.mode(ThemeService.colors.black, BlendMode.srcIn),
      );
}
