import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';

/// Full-width action bar button for playing/listening to AI response audio.
class ListenActionBar extends StatelessWidget {
  const ListenActionBar({
    super.key,
    this.isPlaying = false,
    this.onTap,
  });

  final bool isPlaying;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final IconData icon = isPlaying ? Icons.pause_rounded : Icons.volume_up_rounded;
    final String label = isPlaying ? 'Playing Response...' : 'Listen to Response';

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: AppColors.textPrimary),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTypography.button,
            ),
          ],
        ),
      ),
    );
  }
}
