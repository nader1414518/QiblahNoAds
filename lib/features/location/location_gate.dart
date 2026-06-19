import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/safe_area_widgets.dart';
import '../../providers/app_providers.dart';
import 'manual_city_picker.dart';

class LocationGate extends ConsumerStatefulWidget {
  const LocationGate({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<LocationGate> createState() => _LocationGateState();
}

class _LocationGateState extends ConsumerState<LocationGate> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(locationProvider.notifier).initialize());
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationProvider);

    if (locationState.isLoading && locationState.location == null) {
      return const Scaffold(
        body: SafeFullBody(
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (locationState.needsManualSelection && locationState.location == null) {
      return ManualCityPicker(
        errorCode: locationState.errorCode,
        bottomSafeArea: false,
        onSelected: () async {
          await ref.read(prayerTimesProvider.notifier).load();
        },
      );
    }

    return widget.child;
  }
}
