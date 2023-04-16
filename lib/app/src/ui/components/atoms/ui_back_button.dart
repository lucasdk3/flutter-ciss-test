// coverage:ignore-file
import 'package:go_router/go_router.dart';
import '../../../../../../ciss_test_exports.dart';
import 'package:flutter/material.dart';

class UiBackButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const UiBackButton({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => context.pop(), child: ThemeService.icons.backIcon);
  }
}
