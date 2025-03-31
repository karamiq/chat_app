import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../decoration/auth_decoration.dart';
import '../validators/validators.dart';

class AuthFormField extends ConsumerWidget {
  const AuthFormField({
    super.key,
    this.errorText,
    required this.rules,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
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
    this.readOnly = false,
    this.onTap,
  });

  final List<ValidatorRule> rules;
  final bool readOnly;
  final void Function()? onTap;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
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
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      decoration:
          decoration ??
          authDecoration(
            context,
            hintText: hintText,
            labelText: labelText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
      validator: (value) => ValidatorX.validate(ref, value, rules),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction:
          textInputAction ??
          (nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
      enabled: enabled,
      autofocus: autofocus,
      maxLines: obscureText ? 1 : maxLines,
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
  }
}
