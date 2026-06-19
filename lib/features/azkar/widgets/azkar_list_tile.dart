import 'package:flutter/material.dart';

import '../../../core/models/models.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';

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
  bool _referenceExpanded = false;

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
    final l10n = AppLocalizations.of(context);
    final isDone = widget.item.repeat > 1 && _completed >= widget.item.repeat;
    final isLong = widget.item.arabic.length > 180;
    final reference = widget.item.reference;

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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isDone
                            ? AppColors.emeraldPrimary.withValues(alpha: 0.15)
                            : AppColors.goldAccent.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDone
                              ? AppColors.emeraldPrimary
                              : AppColors.goldAccent,
                        ),
                      ),
                      child: Text(
                        isDone
                            ? l10n.done
                            : '$_completed / ${widget.item.repeat}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isDone
                              ? AppColors.emeraldPrimary
                              : AppColors.goldAccent,
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (reference != null)
                    _ReferenceChip(reference: reference)
                  else if (widget.item.source != null)
                    Text(
                      widget.item.source!,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                ],
              ),
              if (reference != null) ...[
                const SizedBox(height: 8),
                InkWell(
                  onTap: () =>
                      setState(() => _referenceExpanded = !_referenceExpanded),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          _referenceExpanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                          size: 18,
                          color: AppColors.emeraldPrimary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          l10n.hisnNumber(reference.hisn),
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.emeraldPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_referenceExpanded)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reference.citation,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        if (reference.collection != null)
                          Text(
                            reference.collection!,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        if (reference.narrator != null)
                          Text(
                            '${l10n.narrator}: ${reference.narrator}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        if (reference.grade != null)
                          Text(
                            '${l10n.grade}: ${reference.grade}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                      ],
                    ),
                  ),
              ],
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
                  child: Text(_expanded ? l10n.showLess : l10n.showMore),
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
                  l10n.tapToCount,
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

class _ReferenceChip extends StatelessWidget {
  const _ReferenceChip({required this.reference});

  final AzkarReference reference;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = switch (reference.type) {
      'quran' => l10n.referenceQuran,
      'athar' => l10n.referenceAthar,
      _ => l10n.referenceHadith,
    };
    final icon = reference.type == 'quran'
        ? Icons.menu_book_outlined
        : Icons.format_quote_outlined;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.emeraldPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.emeraldPrimary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.emeraldPrimary),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.emeraldPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
