import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/safe_area_widgets.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/premium_widgets.dart';
import '../../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => SafeDialog(
        child: AlertDialog(
          title: DialogHeader(
            title: l10n.resetCounterTitle,
            onClose: () => Navigator.pop(context, false),
          ),
          content: Text(l10n.resetCounterMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l10n.reset),
            ),
          ],
        ),
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
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tasbihTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: l10n.reset,
            onPressed: _reset,
          ),
        ],
      ),
      body: SafeScreenBody(
        child: GestureDetector(
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
                    l10n.tapToCountTasbih,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.tasbihMilestones,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
