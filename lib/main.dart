import 'package:app/core/l10n/l10n.dart';
import 'package:app/core/settings/settings.dart';
import 'package:app/core/settings/shared_preference.dart';
import 'package:app/core/settings/supabase_client.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:app/core/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  await Supabase.initialize(
    url: 'https://yvsibkbdmbknmibzkhsm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl2c2lia2JkbWJrbm1pYnpraHNtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMzMjU0MTIsImV4cCI6MjA1ODkwMTQxMn0.cZMsbzRMqn6XTCQXAPCmaDfLg_finPD1_jUY3oOP0ck',
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => pref),
        supabaseClientProvider.overrideWith((ref) => Supabase.instance.client),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(applicationSettingsProvider);
    final theme = AppTheme();
    return MaterialApp.router(
      scaffoldMessengerKey: AppSnackbar.messengerKey,
      debugShowCheckedModeBanner: false,
      locale: settings.locale,
      theme: theme.buildLightTheme(),
      darkTheme: theme.buildDarkTheme(),
      themeMode: settings.themeMode,
      routerConfig: appRouterProvider,
      onGenerateTitle: (context) => context.l10n.title,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
