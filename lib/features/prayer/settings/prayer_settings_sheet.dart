import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/enums.dart';
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
  late Map<PrayerName, bool> _notifications;

  @override
  void initState() {
    super.initState();
    final preferences = ref.read(preferencesServiceProvider);
    _method = preferences.getCalculationMethod();
    _madhab = preferences.getMadhab();
    _notifications = {
      for (final prayer in [
        PrayerName.fajr,
        PrayerName.dhuhr,
        PrayerName.asr,
        PrayerName.maghrib,
        PrayerName.isha,
      ])
        prayer: preferences.isNotificationEnabled(prayer),
    };
  }

  Future<void> _updateMethod(CalculationMethodId method) async {
    await ref.read(preferencesServiceProvider).setCalculationMethod(method);
    setState(() => _method = method);
    ref.invalidate(calculationMethodProvider);
    await ref.read(prayerTimesProvider.notifier).load();
  }

  Future<void> _updateMadhab(MadhabId madhab) async {
    await ref.read(preferencesServiceProvider).setMadhab(madhab);
    setState(() => _madhab = madhab);
    ref.invalidate(madhabProvider);
    await ref.read(prayerTimesProvider.notifier).load();
  }

  Future<void> _updateNotification(PrayerName prayer, bool enabled) async {
    await ref.read(preferencesServiceProvider).setNotificationEnabled(
      prayer,
      enabled,
    );
    setState(() => _notifications[prayer] = enabled);
    await ref.read(prayerTimesProvider.notifier).load();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text('Calculation Method', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            ...CalculationMethodId.values.map((item) {
              final selected = _method == item;
              return ListTile(
                title: Text(item.label),
                trailing: selected ? const Icon(Icons.check_circle) : null,
                onTap: () => _updateMethod(item),
              );
            }),
            const Divider(),
            Text('Madhab (Asr)', style: Theme.of(context).textTheme.titleSmall),
            ...MadhabId.values.map((item) {
              final selected = _madhab == item;
              return ListTile(
                title: Text(item.label),
                trailing: selected ? const Icon(Icons.check_circle) : null,
                onTap: () => _updateMadhab(item),
              );
            }),
            const Divider(),
            Text('Prayer Notifications', style: Theme.of(context).textTheme.titleSmall),
            ...[
              PrayerName.fajr,
              PrayerName.dhuhr,
              PrayerName.asr,
              PrayerName.maghrib,
              PrayerName.isha,
            ].map((prayer) {
              return SwitchListTile(
                title: Text(prayer.label),
                value: _notifications[prayer] ?? true,
                onChanged: (enabled) => _updateNotification(prayer, enabled),
              );
            }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.location_city_outlined),
              title: const Text('Change city'),
              onTap: () async {
                Navigator.pop(context);
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ManualCityPicker(
                      onSelected: () {
                        ref.read(prayerTimesProvider.notifier).load();
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.my_location_outlined),
              title: const Text('Refresh GPS location'),
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
    builder: (_) => const PrayerSettingsSheet(),
  );
}
