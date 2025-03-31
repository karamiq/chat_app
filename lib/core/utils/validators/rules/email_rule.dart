import 'package:app/core/utils/validators/validators.dart';

class EmailRule extends ValidatorRule {
  @override
  final Map<String, String> defaultMessage = {
    'en': 'Invalid email address',
    'ar': 'عنوان بريد إلكتروني غير صالح',
  };

  EmailRule([String? errorMessage]);
  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }
}
