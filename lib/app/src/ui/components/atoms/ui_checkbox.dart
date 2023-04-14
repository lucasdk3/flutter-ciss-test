import 'package:flutter/material.dart';

import '../../../../../ciss_test_exports.dart';

class UiCheckBox extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool value;
  const UiCheckBox({super.key, this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: ThemeService.colors.white,
        elevation: 2,
        child: Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            splashRadius: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: MaterialStateProperty.all(ThemeService.colors.white),
            checkColor: ThemeService.colors.primary,
          ),
        ),
      ),
    );
  }
}
