import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';
import '../providers/voice_settings_providers.dart';

/// Dropdown field for selecting the voice language (English / اردو).
class LanguageDropdownField extends ConsumerWidget {
  const LanguageDropdownField({super.key});

  static const Map<VoiceLanguage, String> _labels = {
    VoiceLanguage.english: 'English',
    VoiceLanguage.urdu: 'اردو',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<VoiceLanguage>(
          value: ref.watch(voiceLanguageProvider),
          isExpanded: true,
          borderRadius: BorderRadius.circular(AppRadius.md),
          dropdownColor: AppColors.surfaceAlt,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textSecondary,
          ),
          style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
          items: [
            for (final VoiceLanguage language in VoiceLanguage.values)
              DropdownMenuItem<VoiceLanguage>(
                value: language,
                child: Text(
                  _labels[language]!,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
          ],
          onChanged: (VoiceLanguage? language) {
            if (language != null) {
              ref.read(voiceLanguageProvider.notifier).state = language;
            }
          },
        ),
      ),
    );
  }
}
