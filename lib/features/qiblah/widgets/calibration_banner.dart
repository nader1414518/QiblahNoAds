import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class CalibrationBanner extends StatelessWidget {
  const CalibrationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.goldMuted.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.goldAccent.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.screen_rotation, color: AppColors.emeraldPrimary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Move your phone in a figure-8 to improve compass accuracy.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
