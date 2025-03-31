import 'package:app/core/utils/validators/validation_rule.dart';

class RequiredRule extends ValidatorRule {
  @override
  final Map<String, String> defaultMessage = {
    'en': 'This field is required',
    'ar': 'هذا الحقل مطلوب',
  };

  RequiredRule([String? errorMessage]);
  @override
  bool isValid(String? value) {
    return value != null && value.isNotEmpty;
  }
}
