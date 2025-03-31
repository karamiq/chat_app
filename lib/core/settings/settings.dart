import 'dart:convert';
import 'package:app/core/constants/preferences.dart';
import 'package:app/core/settings/shared_preference.dart';
import 'package:app/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default('en') String languageCode,
  }) = _Settings;

  Locale get locale => Locale(languageCode);

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@riverpod
class ApplicationSettings extends _$ApplicationSettings {
  late SharedPreferences pref;
  @override
  Settings build() {
    pref = ref.watch(sharedPreferencesProvider);
    final raw = pref.getString(Preferences.settings);

    if (raw != null) {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return Settings.fromJson(map);
    }

    final defaultSettings = Settings();
    pref.setString(Preferences.settings, jsonEncode(defaultSettings.toJson()));
    return defaultSettings;
  }

  void changeLanguage(String languageCode) {
    state = state.copyWith(languageCode: languageCode);
    _saveSettings();
  }

  void toggleLocale() {
    state = state.copyWith(
      languageCode: state.languageCode == 'en' ? 'ar' : 'en',
    );
    _saveSettings();
  }

  void toggleTheme(BuildContext context) {
    state = state.copyWith(
      themeMode: ThemeX.getOppositeThemeMode(state.themeMode, context),
    );
    _saveSettings();
  }

  void _saveSettings() {
    pref.setString(Preferences.settings, jsonEncode(state.toJson()));
  }
}
