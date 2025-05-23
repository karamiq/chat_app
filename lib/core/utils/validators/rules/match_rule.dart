import '../validation_rule.dart';

class MatchRule extends ValidatorRule {
  final String value;

  @override
  MatchRule(this.value, [String? errorMessage]) : super(errorMessage);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'field must be equal to "$value"',
    'ar': 'الحقل يجب ان يكون مساويا لـ "$value"',
  };

  @override
  bool isValid(String? value) {
    return value == this.value;
  }
}
