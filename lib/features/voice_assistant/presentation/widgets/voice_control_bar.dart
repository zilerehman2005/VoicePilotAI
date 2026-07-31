import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Control bar for the Voice Assistant screen (Stop / Mic-toggle / Cancel).
class VoiceControlBar extends StatelessWidget {
  const VoiceControlBar({
    super.key,
    this.onStopTap,
    this.onMicTap,
    this.onCancelTap,
  });

  final VoidCallback? onStopTap;
  final VoidCallback? onMicTap;
  final VoidCallback? onCancelTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ControlButton(
          icon: Icons.stop_rounded,
          label: 'Stop',
          iconColor: AppColors.error,
          backgroundColor: AppColors.error.withValues(alpha: 0.18),
          borderColor: AppColors.error.withValues(alpha: 0.35),
          onTap: onStopTap,
        ),
        _MainMicButton(
          onTap: onMicTap,
        ),
        _ControlButton(
          icon: Icons.close_rounded,
          label: 'Cancel',
          iconColor: AppColors.textSecondary,
          backgroundColor: AppColors.surface,
          borderColor: AppColors.border,
          onTap: onCancelTap,
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.borderColor,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _MainMicButton extends StatelessWidget {
  const _MainMicButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.45),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(
          Icons.mic_rounded,
          color: AppColors.textPrimary,
          size: 32,
        ),
      ),
    );
  }
}
