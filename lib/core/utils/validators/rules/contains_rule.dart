import '../validation_rule.dart';

class ContainsRule extends ValidatorRule {
  final String value;

  @override
  ContainsRule(this.value, [String? errorMessage]) : super(errorMessage);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'field does not contains "$value"',
    'ar': 'الحقل لايحتوي على "$value"',
  };

  @override
  bool isValid(String? value) {
    return value != null && value.contains(this.value);
  }
}
