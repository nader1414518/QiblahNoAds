import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/models/enums.dart';
import '../../../l10n/app_localizations.dart';
import '../../../services/timezone_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/premium_widgets.dart';

IconData prayerIcon(PrayerName name) {
  switch (name) {
    case PrayerName.fajr:
      return Icons.wb_twilight;
    case PrayerName.sunrise:
      return Icons.wb_sunny_outlined;
    case PrayerName.dhuhr:
      return Icons.light_mode_outlined;
    case PrayerName.asr:
      return Icons.wb_cloudy_outlined;
    case PrayerName.maghrib:
      return Icons.nights_stay_outlined;
    case PrayerName.isha:
      return Icons.dark_mode_outlined;
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.target,
    required this.prayerName,
    required this.timeZoneId,
  });

  final DateTime? target;
  final PrayerName? prayerName;
  final String timeZoneId;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRemaining());
  }

  @override
  void didUpdateWidget(CountdownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.target != widget.target ||
        oldWidget.timeZoneId != widget.timeZoneId) {
      _updateRemaining();
    }
  }

  void _updateRemaining() {
    final target = widget.target;
    if (target == null) {
      setState(() => _remaining = Duration.zero);
      return;
    }

    final now = TimezoneService().nowInLocation(widget.timeZoneId);
    setState(() {
      _remaining = target.isAfter(now)
          ? target.difference(now)
          : Duration.zero;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _format(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prayerLabel = widget.prayerName == null
        ? l10n.nextPrayer
        : l10n.prayerName(widget.prayerName!);

    return Column(
      children: [
        Text(
          prayerLabel,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.goldMuted,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _format(_remaining),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class NextPrayerCard extends StatelessWidget {
  const NextPrayerCard({
    super.key,
    required this.target,
    required this.prayerName,
    required this.cityName,
    required this.hijriLabel,
    required this.timeZoneId,
  });

  final DateTime? target;
  final PrayerName? prayerName;
  final String cityName;
  final String hijriLabel;
  final String timeZoneId;

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      gradient: const LinearGradient(
        colors: [AppColors.emeraldPrimary, AppColors.emeraldLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 18, color: AppColors.goldMuted),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  cityName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.goldMuted,
                  ),
                ),
              ),
              Text(
                hijriLabel,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.goldMuted.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: CountdownTimer(
              target: target,
              prayerName: prayerName,
              timeZoneId: timeZoneId,
            ),
          ),
        ],
      ),
    );
  }
}

class PrayerListTile extends StatelessWidget {
  const PrayerListTile({
    super.key,
    required this.name,
    required this.time,
    required this.isNext,
    required this.isCurrent,
    required this.use24Hour,
  });

  final PrayerName name;
  final DateTime time;
  final bool isNext;
  final bool isCurrent;
  final bool use24Hour;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final timeLabel = use24Hour
        ? DateFormat.Hm().format(time)
        : DateFormat.jm().format(time);

    Color? background;
    Color? borderColor;
    if (isNext) {
      background = AppColors.goldAccent.withValues(alpha: 0.12);
      borderColor = AppColors.goldAccent.withValues(alpha: 0.45);
    } else if (isCurrent) {
      background = AppColors.emeraldPrimary.withValues(alpha: 0.08);
      borderColor = AppColors.emeraldPrimary.withValues(alpha: 0.2);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: ListTile(
        leading: Icon(
          prayerIcon(name),
          color: isNext ? AppColors.goldAccent : AppColors.emeraldPrimary,
        ),
        title: Text(
          l10n.prayerName(name),
          style: TextStyle(
            fontWeight: isNext ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        trailing: Text(
          timeLabel,
          style: TextStyle(
            fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
            color: isNext ? AppColors.emeraldPrimary : null,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}
