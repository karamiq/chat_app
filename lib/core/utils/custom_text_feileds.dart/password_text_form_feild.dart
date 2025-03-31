// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../validators/validators.dart';

class PasswordFormField extends ConsumerWidget {
  const PasswordFormField({
    super.key,
    required this.rules,
    this.errorText,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.enabled = true,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.decoration,
  });

  final List<ValidatorRule> rules;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier obscureText = ValueNotifier<bool>(true);
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (context, isObscured, child) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration:
              decoration ??
              InputDecoration(
                hintText: hintText,
                labelText: labelText,
                prefixIcon: prefixIcon,

                suffixIcon: IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => obscureText.value = !obscureText.value,
                ),
                errorText: errorText,
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest
                    .withOpacity(0.1),
              ),
          validator: (value) => ValidatorX.validate(ref, value, rules),
          obscureText: isObscured,
          keyboardType: keyboardType,
          textInputAction:
              textInputAction ??
              (nextFocusNode != null
                  ? TextInputAction.next
                  : TextInputAction.done),
          enabled: enabled,
          autofocus: autofocus,
          maxLines: isObscured ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          onFieldSubmitted: (value) {
            if (onFieldSubmitted != null) {
              onFieldSubmitted!(value);
            }
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
        );
      },
    );
  }
}
