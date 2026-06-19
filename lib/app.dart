import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/shell/main_shell.dart';
import 'providers/app_providers.dart';
import 'services/notification_service.dart';
import 'services/preferences_service.dart';
import 'services/timezone_service.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Al-Qiblah & Prayer Companion',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
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
      ],
      child: const App(),
    ),
  );
}
