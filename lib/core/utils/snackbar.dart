import 'package:app/core/theme/extra_colors.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  final BuildContext context;

  AppSnackbar(this.context);
  void showErrorSnackBar(String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      elevation: 0,
      backgroundColor: context.theme.extraColors.error,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showSuccessSnackBar(String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      elevation: 0,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      backgroundColor: context.theme.extraColors.success,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showNotificationSnackBar(String title) {
    SnackBar snackBar = SnackBar(
      content: Text(title),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: context.theme.colorScheme.primary,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

extension AppSnackbarX on BuildContext {
  AppSnackbar get snackbar => AppSnackbar(this);
}
