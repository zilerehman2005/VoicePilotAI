import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Tappable language option card with selected state.
class LanguageOptionCard extends StatelessWidget {
  const LanguageOptionCard({
    super.key,
    required this.flagAsset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String flagAsset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.14)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                alignment: Alignment.center,
                child: _FlagContent(flagAsset: flagAsset),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Directionality(
                  textDirection: label == 'اردو' ? TextDirection.rtl : TextDirection.ltr,
                  child: Text(
                    label,
                    style: AppTypography.bodyLarge,
                    textAlign: label == 'اردو' ? TextAlign.right : TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlagContent extends StatelessWidget {
  const _FlagContent({required this.flagAsset});

  final String flagAsset;

  @override
  Widget build(BuildContext context) {
    if (flagAsset.startsWith('assets/')) {
      return Image.asset(
        flagAsset,
        width: 20,
        height: 20,
        fit: BoxFit.cover,
      );
    }

    return Text(
      flagAsset,
      style: const TextStyle(fontSize: 18),
    );
  }
}

