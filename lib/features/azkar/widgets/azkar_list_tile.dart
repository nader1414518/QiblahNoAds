import 'package:flutter/material.dart';

import '../../../core/models/models.dart';
import '../../../core/theme/app_theme.dart';

class AzkarListTile extends StatefulWidget {
  const AzkarListTile({
    super.key,
    required this.item,
  });

  final AzkarItem item;

  @override
  State<AzkarListTile> createState() => _AzkarListTileState();
}

class _AzkarListTileState extends State<AzkarListTile> {
  int _completed = 0;
  bool _expanded = false;

  void _onTap() {
    if (widget.item.repeat <= 1) {
      return;
    }
    setState(() {
      _completed = (_completed + 1).clamp(0, widget.item.repeat);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDone = widget.item.repeat > 1 && _completed >= widget.item.repeat;
    final isLong = widget.item.arabic.length > 180;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.item.repeat > 1 ? _onTap : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  if (widget.item.repeat > 1)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDone
                            ? AppColors.emeraldPrimary.withValues(alpha: 0.15)
                            : AppColors.goldAccent.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDone ? AppColors.emeraldPrimary : AppColors.goldAccent,
                        ),
                      ),
                      child: Text(
                        isDone ? 'Done' : '$_completed / ${widget.item.repeat}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isDone ? AppColors.emeraldPrimary : AppColors.goldAccent,
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (widget.item.source != null)
                    Text(
                      widget.item.source!,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                widget.item.arabic,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: _expanded || !isLong ? null : 4,
                overflow: _expanded || !isLong ? null : TextOverflow.ellipsis,
                style: AppTheme.amiri(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (isLong)
                TextButton(
                  onPressed: () => setState(() => _expanded = !_expanded),
                  child: Text(_expanded ? 'Show less' : 'Show more'),
                ),
              const SizedBox(height: 12),
              Text(
                widget.item.english,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              if (widget.item.repeat > 1 && !isDone) ...[
                const SizedBox(height: 8),
                Text(
                  'Tap card to count repetitions',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.emeraldPrimary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
