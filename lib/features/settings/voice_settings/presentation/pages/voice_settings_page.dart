import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../shared/widgets/misc/section_header.dart';
import '../../../../../shared/widgets/navigation/top_app_bar.dart';
import '../providers/voice_settings_providers.dart';
import '../widgets/labeled_slider.dart';
import '../widgets/language_dropdown_field.dart';

/// Voice settings screen for language, speed, pitch, and gender.
class VoiceSettingsPage extends ConsumerWidget {
  const VoiceSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceGender selectedGender = ref.watch(voiceGenderProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'Voice Settings',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [
                const _SectionLabel('Voice Language'),
                const LanguageDropdownField(),
                const SizedBox(height: AppSpacing.lg),
                LabeledSlider(
                  label: 'Voice Speed',
                  value: ref.watch(voiceSpeedProvider),
                  minLabel: 'Slow',
                  midLabel: 'Normal',
                  maxLabel: 'Fast',
                  onChanged: (double value) =>
                      ref.read(voiceSpeedProvider.notifier).state = value,
                ),
                LabeledSlider(
                  label: 'Voice Pitch',
                  value: ref.watch(voicePitchProvider),
                  minLabel: 'Low',
                  midLabel: 'Normal',
                  maxLabel: 'High',
                  onChanged: (double value) =>
                      ref.read(voicePitchProvider.notifier).state = value,
                ),
                const SizedBox(height: AppSpacing.sm),
                const _SectionLabel('Voice Gender'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  child: Row(
                    children: [
                      Expanded(
                        child: _GenderOption(
                          label: 'Female',
                          selected: selectedGender == VoiceGender.female,
                          onTap: () => ref
                              .read(voiceGenderProvider.notifier)
                              .state = VoiceGender.female,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _GenderOption(
                          label: 'Male',
                          selected: selectedGender == VoiceGender.male,
                          onTap: () => ref
                              .read(voiceGenderProvider.notifier)
                              .state = VoiceGender.male,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      child: SectionHeader(title: title),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: selected ? AppColors.primary : AppColors.border,
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? AppColors.primary : Colors.transparent,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(label, style: AppTypography.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
