import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/settings/settings.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.watch(applicationSettingsProvider.notifier).toggleLocale();
          ref.watch(applicationSettingsProvider.notifier).toggleTheme(context);
        },
      ),
      appBar: AppBar(title: Text(context.l10n.title)),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            title: Text(context.l10n.theme),
            secondary: Icon(
              context.isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            value: context.isDarkMode,
            onChanged:
                (_) => ref
                    .read(applicationSettingsProvider.notifier)
                    .toggleTheme(context),
          ),
        ],
      ),
    );
  }
}
