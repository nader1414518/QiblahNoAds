import 'package:flutter/material.dart';

import '../../features/prayer/settings/prayer_settings_sheet.dart';
import '../../l10n/app_localizations.dart';

class SettingsIconButton extends StatelessWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      tooltip: l10n.settings,
      onPressed: () => showPrayerSettingsSheet(context),
    );
  }
}
