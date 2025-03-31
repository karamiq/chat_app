import 'package:app/core/utils/validators/validation_rule.dart';

class OnlyNumbersRule extends ValidatorRule {
  @override
  final Map<String, String> defaultMessage = {
    'en': 'This field must contain only numbers',
    'ar': 'يجب أن يحتوي هذا الحقل على أرقام فقط',
  };

  OnlyNumbersRule([String? errorMessage]);
  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }
}
