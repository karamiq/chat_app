import 'package:app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

InputDecoration authDecoration(
  BuildContext context, {
  String? hintText,
  String? labelText,
  String? errorText,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  final gg = context.theme.colorScheme;
  return InputDecoration(
    helperText: '',
    hintText: hintText,
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    errorText: errorText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: gg.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: gg.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: gg.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: gg.error),
    ),
    filled: true,
    fillColor: gg.surfaceContainerHighest.withOpacity(0.1),
  );
}
