import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'validation_rule.dart';

class ValidatorX {
  static String? validate(
    WidgetRef ref,
    String? value,
    List<ValidatorRule> rules,
  ) {
    for (final rule in rules) {
      if (!rule.isValid(value)) {
        return rule.getMessage(ref);
      }
    }
    return null;
  }
}
