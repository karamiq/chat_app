import 'dart:convert';

import 'package:app/data/models/authentication_model.dart';
import 'package:app/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/preferences.dart';
import '../../core/settings/shared_preference.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  late SharedPreferences pref;
  @override
  AuthenticationModel? build() {
    pref = ref.watch(sharedPreferencesProvider);
    final raw = pref.getString(Preferences.authentication);
    return raw != null ? AuthenticationModel.fromJson(jsonDecode(raw)) : null;
  }

  void login(AuthenticationModel model) {
    state = model;
    _saveSettings();
  }

  void logout() => _clear();

  bool get isAuthenticated => state != null;

  //-------------------------- Private methods --------------------------
  void _saveSettings() {
    pref.setString(Preferences.settings, jsonEncode(state!.toJson()));
  }

  _clear() {
    pref.remove(Preferences.authentication);
    appRouterProvider.go(Routes.login);
  }
}
