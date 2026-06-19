import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class CalibrationBanner extends StatelessWidget {
  const CalibrationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: AppTheme.primaryGreen.withValues(alpha: 0.12),
      child: Row(
        children: [
          const Icon(Icons.screen_rotation),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Compass accuracy is low. Move your phone in a figure-8 pattern to calibrate.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
