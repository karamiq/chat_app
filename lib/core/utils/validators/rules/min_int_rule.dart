import '../validation_rule.dart';

class MinIntRule extends ValidatorRule {
  final int length;
  @override
  MinIntRule(this.length, [String? errorMessage]) : super(errorMessage);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'The number must be greater than $length',
    'ar': 'العدد يجب ان لا يكون اقل من $length',
  };

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (int.parse(value) < length) {
      return false;
    }
    return true;
  }
}
