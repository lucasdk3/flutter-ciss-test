import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../ciss_test_exports.dart';

class ValidationMessages {
  static Map<String, ValidationMessageFunction> value({
    ValidationMessageFunction? requiredLabel,
    ValidationMessageFunction? minLengthLabel,
    ValidationMessageFunction? maxLengthLabel,
    int? minNumber,
    int? maxNumber,
    String? formControlName,
  }) =>
      {
        ConstantsValidators.REQUIRED: requiredLabel ??
            (error) => 'O campo ${formControlName ?? ''} é obrigatório',
        ConstantsValidators.MIN_LENGTH: minLengthLabel ??
            (error) {
              final errorMap = (error as Map<String, dynamic>);
              final requiredLenght = errorMap['requiredLength'];
              return 'O campo deve ter no minimo ${minNumber ?? requiredLenght} caracteres';
            },
        ConstantsValidators.MAX_LENGTH: maxLengthLabel ??
            (error) =>
                'O campo deve ter no máximo ${maxNumber ?? '100'} caracteres',
      };
}
