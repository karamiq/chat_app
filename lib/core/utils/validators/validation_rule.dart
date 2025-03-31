import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;

import '../../settings/settings.dart';

abstract class ValidatorRule {
  final String? errorMessage;

  bool isValid(String? vlue);
  abstract final Map<String, String> defaultMessage;

  const ValidatorRule([this.errorMessage]);

  String? getMessage(WidgetRef ref) =>
      errorMessage ??
      defaultMessage[ref.read(applicationSettingsProvider).languageCode];
}
