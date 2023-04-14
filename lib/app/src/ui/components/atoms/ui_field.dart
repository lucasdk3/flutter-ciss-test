import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../ciss_test_exports.dart';

class UiField extends StatelessWidget {
  const UiField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.controller,
    required this.formControlName,
    this.autovalidateMode,
    this.validationMessages,
    this.helperText,
    this.maxLenght,
    this.maxLines,
    this.padding,
    this.radius,
    this.width,
    this.minLenght,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String formControlName;
  final AutovalidateMode? autovalidateMode;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final double? padding;
  final String? helperText;
  final int? maxLenght;
  final int? maxLines;
  final double? radius;
  final double? width;
  final int? minLenght;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: width ?? double.infinity,
          child: ReactiveTextField(
            maxLength: maxLenght,
            maxLines: 10,
            minLines: 10,
            formControlName: formControlName,
            validationMessages: ValidationMessages.value(
                minNumber: minLenght,
                maxNumber: maxLenght,
                formControlName: labelText),
            controller: controller,
            style: ThemeService.styles.ralewayBody(),
            cursorColor: ThemeService.colors.black,
            cursorWidth: 1,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              fillColor: ThemeService.colors.white,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
              helperText: helperText,
              helperStyle: ThemeService.styles.ralewayHelper(),
              errorStyle:
                  TextStyle(height: 1, color: ThemeService.colors.danger),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.black),
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.black),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.black),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.danger),
                  borderRadius: BorderRadius.circular(10)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeService.colors.secondary),
                  borderRadius: BorderRadius.circular(10)),
              labelText: labelText,
              hintText: hintText,
              labelStyle: ThemeService.styles.ralewayBody(),
              floatingLabelStyle: ThemeService.styles.ralewayBody(),
            ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            showErrors: (control) => control.invalid && control.touched,
          ),
        ),
      ],
    );
  }
}
