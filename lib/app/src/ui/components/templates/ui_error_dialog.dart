import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../ciss_test_exports.dart';

class UiErrorDialog extends StatelessWidget {
  final Failure? error;
  final String? message;
  final VoidCallback? onPressedPrimaryButton;
  final VoidCallback? onPressedSecondaryButton;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  const UiErrorDialog({
    Key? key,
    this.error,
    this.message,
    this.onPressedPrimaryButton,
    this.onPressedSecondaryButton,
    this.primaryButtonText,
    this.secondaryButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      backgroundColor: ThemeService.colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        height: context.height * 0.5,
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AutoSizeText(
                  error?.message ?? ConstantsStrings.defaultErrorMessage,
                  style: ThemeService.styles
                      .ralewayBody(color: ThemeService.colors.primary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                if (error?.detail != null)
                  AutoSizeText(
                    error?.detail ?? ConstantsStrings.defaultErrorDetails,
                    style: ThemeService.styles
                        .ralewayBody(color: ThemeService.colors.primary),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
            UiButton(
                onPressed: onPressedPrimaryButton ?? () => context.pop(),
                label: primaryButtonText ??
                    (onPressedSecondaryButton != null
                        ? 'primary_button_text_error'
                        : 'secondary_button_text_error')),
            if (onPressedSecondaryButton != null)
              TextButton(
                  onPressed: onPressedSecondaryButton,
                  child: AutoSizeText(
                    secondaryButtonText ?? 'secondary_button_text_error',
                    style: ThemeService.styles
                        .ralewayBody(color: ThemeService.colors.primary),
                  )),
          ],
        ),
      ),
    );
  }
}
