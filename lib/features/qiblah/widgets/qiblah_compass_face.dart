import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_theme.dart';

class QiblahCompassFace extends StatelessWidget {
  const QiblahCompassFace({
    super.key,
    required this.direction,
    required this.qiblah,
    required this.aligned,
  });

  final double direction;
  final double qiblah;
  final bool aligned;

  @override
  Widget build(BuildContext context) {
    final compassSvg = SvgPicture.asset('assets/compass.svg');
    final needleSvg = SvgPicture.asset(
      'assets/needle.svg',
      fit: BoxFit.contain,
      height: 290,
      alignment: Alignment.center,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: 310,
          height: 310,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: aligned ? AppColors.goldAccent : Colors.transparent,
              width: aligned ? 4 : 0,
            ),
            boxShadow: aligned
                ? [
                    BoxShadow(
                      color: AppColors.goldAccent.withValues(alpha: 0.35),
                      blurRadius: 24,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Transform.rotate(
            angle: direction * (pi / 180) * -1,
            child: compassSvg,
          ),
        ),
        Transform.rotate(
          angle: qiblah * (pi / 180) * -1,
          alignment: Alignment.center,
          child: needleSvg,
        ),
      ],
    );
  }
}

class QiblahStatusBanner extends StatelessWidget {
  const QiblahStatusBanner({
    super.key,
    required this.aligned,
    required this.offset,
  });

  final bool aligned;
  final double offset;

  String get _message {
    if (aligned) {
      return 'Facing Qiblah';
    }
    final degrees = offset.abs().ceil();
    return offset > 0 ? 'Rotate right $degrees°' : 'Rotate left $degrees°';
  }

  IconData get _icon {
    if (aligned) {
      return Icons.check_circle;
    }
    return offset > 0 ? Icons.rotate_right : Icons.rotate_left;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: aligned
            ? AppColors.emeraldPrimary.withValues(alpha: 0.12)
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: aligned ? AppColors.goldAccent : AppColors.emeraldPrimary.withValues(alpha: 0.25),
          width: aligned ? 2 : 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _icon,
            color: aligned ? AppColors.goldAccent : AppColors.emeraldPrimary,
          ),
          const SizedBox(width: 8),
          Text(
            _message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: aligned ? AppColors.emeraldPrimary : null,
            ),
          ),
          if (!aligned) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.goldMuted.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${offset.abs().toStringAsFixed(1)}°',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
