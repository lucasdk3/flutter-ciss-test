import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../ciss_test_exports.dart';

class UiSuccessDialog extends StatelessWidget {
  final String? text;
  final String? detail;
  const UiSuccessDialog({Key? key, this.text, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      backgroundColor: ThemeService.colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        height: context.height * 0.35,
        width: 400,
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.check_circle_outline,
                  color: ThemeService.colors.primary, size: 50),
            ),
            AutoSizeText(
              text ?? '',
              maxFontSize: 25,
              minFontSize: 20,
              maxLines: 3,
              style: ThemeService.styles
                  .ralewayBody(color: ThemeService.colors.primary, size: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
