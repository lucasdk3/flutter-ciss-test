import 'package:flutter/material.dart';
// coverage:ignore-file
import 'package:flutter_ciss_test/ciss_test_exports.dart';

class UiLoading extends StatelessWidget {
  final Color? color;
  const UiLoading({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: color ?? ThemeService.colors.primary,
      ),
    );
  }
}
