import 'package:flutter/material.dart';

import '../../../core/models/models.dart';

class AzkarListTile extends StatelessWidget {
  const AzkarListTile({
    super.key,
    required this.item,
  });

  final AzkarItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (item.repeat > 1)
              Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  label: Text('${item.repeat}x'),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            Text(
              item.arabic,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                height: 1.8,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.english,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
