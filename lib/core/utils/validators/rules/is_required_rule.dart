import '../validation_rule.dart';

class IsRequiredRule extends ValidatorRule {
  @override
  IsRequiredRule([super.errorMessage]);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'field is required',
    'ar': 'هذا الحقل مطلوب',
  };

  @override
  bool isValid(String? value) {
    return value != null && value.isNotEmpty;
  }
}
