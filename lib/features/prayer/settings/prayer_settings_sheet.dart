import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/widgets/safe_area_widgets.dart';
import '../../../core/models/enums.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/premium_widgets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../location/manual_city_picker.dart';

class PrayerSettingsSheet extends ConsumerStatefulWidget {
  const PrayerSettingsSheet({super.key});

  @override
  ConsumerState<PrayerSettingsSheet> createState() => _PrayerSettingsSheetState();
}

class _PrayerSettingsSheetState extends ConsumerState<PrayerSettingsSheet> {
  late CalculationMethodId _method;
  late MadhabId _madhab;
  late bool _use24Hour;
  late Map<PrayerName, bool> _notifications;
  late Map<PrayerName, int> _adjustments;

  @override
  void initState() {
    super.initState();
    final preferences = ref.read(preferencesServiceProvider);
    _method = preferences.getCalculationMethod();
    _madhab = preferences.getMadhab();
    _use24Hour = preferences.getUse24Hour();
    _notifications = {
      for (final prayer in _notifiablePrayers)
        prayer: preferences.isNotificationEnabled(prayer),
    };
    _adjustments = {
      for (final prayer in _adjustablePrayers)
        prayer: preferences.getAdjustment(prayer),
    };
  }

  static const _notifiablePrayers = [
    PrayerName.fajr,
    PrayerName.dhuhr,
    PrayerName.asr,
    PrayerName.maghrib,
    PrayerName.isha,
  ];

  static const _adjustablePrayers = _notifiablePrayers;

  Future<void> _reloadPrayers() async {
    ref.invalidate(calculationMethodProvider);
    ref.invalidate(madhabProvider);
    await ref.read(prayerTimesProvider.notifier).load();
  }

  Future<void> _updateMethod(CalculationMethodId method) async {
    await ref.read(preferencesServiceProvider).setCalculationMethod(method);
    setState(() => _method = method);
    await _reloadPrayers();
  }

  Future<void> _updateMadhab(MadhabId madhab) async {
    await ref.read(preferencesServiceProvider).setMadhab(madhab);
    setState(() => _madhab = madhab);
    await _reloadPrayers();
  }

  Future<void> _updateAdjustment(PrayerName prayer, int delta) async {
    final next = (_adjustments[prayer] ?? 0) + delta;
    final clamped = next.clamp(-30, 30);
    await ref.read(preferencesServiceProvider).setAdjustment(prayer, clamped);
    setState(() => _adjustments[prayer] = clamped);
    await _reloadPrayers();
  }

  Future<void> _selectLocale(Locale locale) async {
    await ref.read(preferencesServiceProvider).setLocale(locale);
    ref.read(localeProvider.notifier).state = locale;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetHeader(title: l10n.settings),
            const SizedBox(height: 16),
            SectionHeader(
              title: l10n.language,
              subtitle: l10n.languageSubtitle,
            ),
            ...supportedAppLocales.map((locale) {
              final selected = currentLocale.languageCode == locale.languageCode;
              return ListTile(
                title: Text(l10n.languageLabel(locale)),
                trailing: selected
                    ? const Icon(Icons.check_circle, color: AppColors.goldAccent)
                    : null,
                onTap: () => _selectLocale(locale),
              );
            }),
            const GoldDivider(),
            SectionHeader(
              title: l10n.calculationMethod,
              subtitle: l10n.calculationMethodSubtitle,
            ),
            ...CalculationMethodId.values.map((item) {
              final selected = _method == item;
              return ListTile(
                title: Text(l10n.calculationMethodName(item)),
                trailing: selected
                    ? const Icon(Icons.check_circle, color: AppColors.goldAccent)
                    : null,
                onTap: () => _updateMethod(item),
              );
            }),
            const GoldDivider(),
            SectionHeader(title: l10n.madhab),
            ...MadhabId.values.map((item) {
              final selected = _madhab == item;
              return ListTile(
                title: Text(l10n.madhabName(item)),
                trailing: selected
                    ? const Icon(Icons.check_circle, color: AppColors.goldAccent)
                    : null,
                onTap: () => _updateMadhab(item),
              );
            }),
            const GoldDivider(),
            SectionHeader(
              title: l10n.fineTune,
              subtitle: l10n.fineTuneSubtitle,
            ),
            ..._adjustablePrayers.map((prayer) {
              final value = _adjustments[prayer] ?? 0;
              return ListTile(
                title: Text(l10n.prayerName(prayer)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => _updateAdjustment(prayer, -1),
                    ),
                    SizedBox(
                      width: 36,
                      child: Text(
                        '$value',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => _updateAdjustment(prayer, 1),
                    ),
                  ],
                ),
              );
            }),
            SwitchListTile(
              title: Text(l10n.use24Hour),
              value: _use24Hour,
              onChanged: (value) async {
                await ref.read(preferencesServiceProvider).setUse24Hour(value);
                setState(() => _use24Hour = value);
              },
            ),
            const GoldDivider(),
            SectionHeader(title: l10n.notifications),
            ..._notifiablePrayers.map((prayer) {
              return SwitchListTile(
                title: Text(l10n.prayerName(prayer)),
                value: _notifications[prayer] ?? true,
                onChanged: (enabled) async {
                  await ref.read(preferencesServiceProvider).setNotificationEnabled(
                    prayer,
                    enabled,
                  );
                  setState(() => _notifications[prayer] = enabled);
                  await _reloadPrayers();
                },
              );
            }),
            const GoldDivider(),
            ListTile(
              leading: const Icon(Icons.location_city_outlined),
              title: Text(l10n.changeCity),
              onTap: () async {
                Navigator.pop(context);
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ManualCityPicker(
                      onSelected: () => ref.read(prayerTimesProvider.notifier).load(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.my_location_outlined),
              title: Text(l10n.refreshGps),
              onTap: () async {
                Navigator.pop(context);
                await ref.read(locationProvider.notifier).refreshGps();
                await ref.read(prayerTimesProvider.notifier).load();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showPrayerSettingsSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => const SafeSheet(child: PrayerSettingsSheet()),
  );
}
