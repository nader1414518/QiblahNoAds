import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/models/enums.dart';
import '../../../core/theme/app_theme.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.target,
    required this.prayerName,
  });

  final DateTime? target;
  final PrayerName? prayerName;

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
    if (oldWidget.target != widget.target) {
      _updateRemaining();
    }
  }

  void _updateRemaining() {
    final target = widget.target;
    if (target == null) {
      setState(() => _remaining = Duration.zero);
      return;
    }

    final now = DateTime.now();
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
    final prayerLabel = widget.prayerName?.label ?? 'Next Prayer';

    return Column(
      children: [
        Text(
          prayerLabel,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppTheme.primaryGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _format(_remaining),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
            fontWeight: FontWeight.bold,
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
  });

  final DateTime? target;
  final PrayerName? prayerName;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    cityName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: CountdownTimer(
                target: target,
                prayerName: prayerName,
              ),
            ),
          ],
        ),
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
  });

  final PrayerName name;
  final DateTime time;
  final bool isNext;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final timeLabel = DateFormat.jm().format(time);
    final colorScheme = Theme.of(context).colorScheme;

    Color? background;
    if (isNext) {
      background = AppTheme.primaryGreen.withValues(alpha: 0.12);
    } else if (isCurrent) {
      background = colorScheme.surfaceContainerHighest;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          name.label,
          style: TextStyle(
            fontWeight: isNext ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        trailing: Text(
          timeLabel,
          style: TextStyle(
            fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
            color: isNext ? AppTheme.primaryGreen : null,
          ),
        ),
      ),
    );
  }
}
