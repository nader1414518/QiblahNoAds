import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/l10n/l10n_extensions.dart';
import 'core/theme/app_theme.dart';
import 'features/shell/main_shell.dart';
import 'l10n/app_localizations.dart';
import 'providers/app_providers.dart';
import 'services/notification_service.dart';
import 'services/preferences_service.dart';
import 'services/timezone_service.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Al-Qiblah & Prayer Companion',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedAppLocales,
      home: const MainShell(),
    );
  }
}

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  TimezoneService.ensureInitialized();

  final preferences = await PreferencesService.create();
  final notifications = NotificationService(preferences);
  await notifications.initialize();
  await notifications.requestPermissions();

  runApp(
    ProviderScope(
      overrides: [
        preferencesServiceProvider.overrideWithValue(preferences),
        notificationServiceProvider.overrideWithValue(notifications),
        localeProvider.overrideWith((ref) => preferences.getLocale()),
      ],
      child: const App(),
    ),
  );
}
