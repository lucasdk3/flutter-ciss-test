// coverage:ignore-file
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../../../ciss_test_exports.dart';
import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final EdgeInsets? padding;
  final bool isLoading;
  final Color? buttonColor;
  final double? width;
  final double? radius;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final double? fontSize;
  const UiButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.padding,
    this.isLoading = false,
    this.width,
    this.height,
    this.fontSize,
    this.buttonColor,
    this.mainAxisAlignment,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: height ?? 70,
        width: width ?? double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: buttonColor ?? ThemeService.colors.primary,
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 8,
              backgroundColor: buttonColor ?? ThemeService.colors.primary,
              padding: padding,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ).merge(
              ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius ?? 8),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(5)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading) const UiLoading(),
                  if (!isLoading)
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: AutoSizeText(label,
                            overflow: TextOverflow.fade,
                            maxFontSize: fontSize ?? 16,
                            minFontSize: 10,
                            maxLines: 1,
                            style: ThemeService.styles.ralewayButton(
                                size: fontSize,
                                color: ThemeService.colors.white)),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
