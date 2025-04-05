import 'package:app/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DeviceHeight on BuildContext {
  double get height => MediaQuery.of(this).size.height;
}

extension DeviceWidth on BuildContext {
  double get width => MediaQuery.of(this).size.width;
}

extension DateFormating on DateTime {
  String formateDate(String? local) =>
      DateFormat('yy/MM/dd', local).format(this);
  String formateDateDash(String? local) =>
      DateFormat('yy-MM-dd', local).format(this);
  String formateTime(String? local) => DateFormat('HH:mm', local).format(this);
  String formateDateTime(String? local) =>
      DateFormat('yy/MM/dd HH:mm', local).format(this);
  String formateDateWithDay(String? local) =>
      DateFormat('EEE, yy/MM/dd', local).format(this);
  String formateDateWithDayTime(String? local) =>
      DateFormat('EEE, yy/MM/dd HH:mm', local).format(this);
  String formateDateWithDayTimeSecond(String? local) =>
      DateFormat('EEE, yy/MM/dd HH:mm:ss', local).format(this);
}

extension L10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension ThemeExten on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
