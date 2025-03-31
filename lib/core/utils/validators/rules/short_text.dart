import '../validation_rule.dart';

class ShortText extends ValidatorRule {
  @override
  final Map<String, String> defaultMessage = {
    'en': 'This field must be at least 3 characters',
    'ar': 'يجب أن يكون هذا الحقل على الأقل 3 أحرف',
  };

  ShortText([super.errorMessage]);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length < 3) {
      return false;
    }
    return true;
  }
}
