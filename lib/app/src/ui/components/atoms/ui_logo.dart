import 'package:flutter/material.dart';
import '../../../../../ciss_test_exports.dart';

class UiLogo extends StatelessWidget {
  final double? height;
  const UiLogo({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height ?? context.height * 0.03),
      child: Center(child: ThemeService.images.logoImage),
    );
  }
}
