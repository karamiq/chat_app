import '../validation_rule.dart';

class MinLengthRule extends ValidatorRule {
  final int length;
  @override
  MinLengthRule(this.length, [String? errorMessage]) : super(errorMessage);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'field length must be equal or greater than $length',
    'ar': 'يجب أن يكون طول الحقل مساوي او اكثر من $length',
  };

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length < length) {
      return false;
    }
    return true;
  }
}
