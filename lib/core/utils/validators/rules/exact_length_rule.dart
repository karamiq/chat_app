import '../validation_rule.dart';

class ExactLengthRule extends ValidatorRule {
  final int length;
  @override
  ExactLengthRule(this.length, [String? errorMessage]) : super(errorMessage);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'field length must be equal to $length',
    'ar': 'يجب أن يكون طول الحقل مساويًا لـ $length',
  };

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length != length) {
      return false;
    }
    return true;
  }
}
