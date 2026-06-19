import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/enums.dart';
import '../../core/models/models.dart';
import '../../core/utils/date_formatters.dart';
import '../../providers/app_providers.dart';
import '../../services/prayer_calculation_service.dart';
import '../location/manual_city_picker.dart';
import 'settings/prayer_settings_sheet.dart';
import 'widgets/prayer_widgets.dart';

class PrayerTimesScreen extends ConsumerStatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  ConsumerState<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends ConsumerState<PrayerTimesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final location = ref.read(locationProvider).location;
      if (location != null) {
        await ref.read(prayerTimesProvider.notifier).load();
      }
    });
  }

  DateTime? _resolveNextTime({
    required PrayerCalculationService calculator,
    required DailyPrayerTimes today,
    required DailyPrayerTimes? tomorrow,
    required DateTime now,
  }) {
    final time = calculator.nextPrayerTime(today, now);
    if (time != null) {
      return time;
    }
    if (tomorrow != null) {
      return tomorrow.times[PrayerName.fajr];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(locationProvider, (previous, next) {
      if (next.location != null && previous?.location != next.location) {
        ref.read(prayerTimesProvider.notifier).load();
      }
    });

    final locationState = ref.watch(locationProvider);
    final prayerState = ref.watch(prayerTimesProvider);
    final calculator = ref.watch(prayerCalculationServiceProvider);
    final preferences = ref.watch(preferencesServiceProvider);
    final use24Hour = preferences.getUse24Hour();
    final now = DateTime.now();

    final nextPrayer = prayerState.today == null
        ? null
        : calculator.nextPrayer(prayerState.today!, now);
    final nextTime = prayerState.today == null
        ? null
        : _resolveNextTime(
            calculator: calculator,
            today: prayerState.today!,
            tomorrow: prayerState.tomorrow,
            now: now,
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => showPrayerSettingsSheet(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(locationProvider.notifier).refreshGps();
          await ref.read(prayerTimesProvider.notifier).load();
        },
        child: _buildBody(
          context: context,
          ref: ref,
          locationName: locationState.location?.cityName ?? 'Unknown',
          prayerState: prayerState,
          nextPrayer: nextPrayer,
          nextTime: nextTime,
          use24Hour: use24Hour,
          dateLabel: formatDisplayDate(now),
        ),
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required WidgetRef ref,
    required String locationName,
    required PrayerTimesState prayerState,
    required PrayerName? nextPrayer,
    required DateTime? nextTime,
    required bool use24Hour,
    required String dateLabel,
  }) {
    if (prayerState.isLoading && prayerState.today == null) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
        ],
      );
    }

    if (prayerState.error != null && prayerState.today == null) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 120),
          Center(child: Text(prayerState.error!)),
          const SizedBox(height: 16),
          Center(
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ManualCityPicker(
                      onSelected: () {
                        ref.read(prayerTimesProvider.notifier).load();
                      },
                    ),
                  ),
                );
              },
              child: const Text('Select City'),
            ),
          ),
        ],
      );
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        NextPrayerCard(
          target: nextTime,
          prayerName: nextPrayer,
          cityName: locationName,
          hijriLabel: dateLabel,
        ),
        const SizedBox(height: 16),
        Text(
          'Today\'s Schedule',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        ...prayerState.schedule.map((entry) {
          return PrayerListTile(
            name: entry.name,
            time: entry.time,
            isNext: entry.isNext,
            isCurrent: entry.isCurrent,
            use24Hour: use24Hour,
          );
        }),
      ],
    );
  }
}
