import 'package:app/core/utils/validators/validation_rule.dart'
    show ValidatorRule;

class RegexRule extends ValidatorRule {
  final String pattern;

  @override
  RegexRule(this.pattern, [String? errorMessage]) : super(errorMessage);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'invalid input',
    'ar': 'ادخال خاطئ',
  };

  @override
  bool isValid(String? vlue) {
    if (vlue == null || vlue.isEmpty) {
      return false;
    }
    return RegExp(pattern).hasMatch(vlue);
  }
}
