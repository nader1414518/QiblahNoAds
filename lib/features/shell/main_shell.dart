import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../azkar/azkar_screen.dart';
import '../location/location_gate.dart';
import '../prayer/prayer_times_screen.dart';
import '../qiblah/qiblah_screen.dart';

class MainShell extends ConsumerStatefulWidget {
  const MainShell({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  Widget _screenForIndex(int index) {
    switch (index) {
      case 0:
        return const QiblahScreen();
      case 1:
        return const PrayerTimesScreen();
      case 2:
        return const AzkarScreen();
      default:
        return const QiblahScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationGate(
        child: _screenForIndex(_index),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Qiblah',
          ),
          NavigationDestination(
            icon: Icon(Icons.schedule_outlined),
            selectedIcon: Icon(Icons.schedule),
            label: 'Prayer Times',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Azkar',
          ),
        ],
      ),
    );
  }
}
