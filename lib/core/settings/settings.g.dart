// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      languageCode: json['languageCode'] as String? ?? 'en',
    );

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'languageCode': instance.languageCode,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$applicationSettingsHash() =>
    r'f7ba16680683cc836e72428575d7a7136ce30a66';

/// See also [ApplicationSettings].
@ProviderFor(ApplicationSettings)
final applicationSettingsProvider =
    AutoDisposeNotifierProvider<ApplicationSettings, Settings>.internal(
  ApplicationSettings.new,
  name: r'applicationSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$applicationSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ApplicationSettings = AutoDisposeNotifier<Settings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
