import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/premium_widgets.dart';
import '../../providers/app_providers.dart';

class TasbihScreen extends ConsumerStatefulWidget {
  const TasbihScreen({super.key});

  @override
  ConsumerState<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends ConsumerState<TasbihScreen> {
  int _count = 0;
  int _lastMilestone = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        _count = ref.read(preferencesServiceProvider).getTasbihCount();
      });
    });
  }

  Future<void> _increment() async {
    setState(() => _count++);
    HapticFeedback.lightImpact();

    if (_count == 33 || _count == 100) {
      if (_lastMilestone != _count) {
        HapticFeedback.heavyImpact();
        _lastMilestone = _count;
      }
    }

    await ref.read(preferencesServiceProvider).setTasbihCount(_count);
    ref.read(tasbihCountProvider.notifier).state = _count;
  }

  Future<void> _reset() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset counter?'),
        content: const Text('This will clear your current Tasbih session count.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      return;
    }

    setState(() {
      _count = 0;
      _lastMilestone = 0;
    });
    await ref.read(preferencesServiceProvider).resetTasbihCount();
    ref.read(tasbihCountProvider.notifier).state = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset',
            onPressed: _reset,
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _increment,
        child: Center(
          child: PremiumCard(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 56),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.goldAccent, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.emeraldPrimary.withValues(alpha: 0.15),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$_count',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.emeraldPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Tap anywhere to count',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'Milestones at 33 and 100',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
