import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../auth/login/presentation/pages/login_page.dart';
import '../controllers/language_selection_controller.dart';
import '../widgets/language_option_card.dart';

class ChooseLanguagePage extends ConsumerWidget {
  const ChooseLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? selectedLanguage = ref.watch(languageSelectionProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl),
              Text('Choose Language', style: AppTypography.h1),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Select your preferred language.',
                style: AppTypography.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xl),
              LanguageOptionCard(
                flagAsset: '🇬🇧',
                label: 'English',
                isSelected: selectedLanguage == 'en',
                onTap: () {
                  ref.read(languageSelectionProvider.notifier).state = 'en';
                },
              ),
              const SizedBox(height: AppSpacing.md),
              LanguageOptionCard(
                flagAsset: '🇵🇰',
                label: 'اردو',
                isSelected: selectedLanguage == 'ur',
                onTap: () {
                  ref.read(languageSelectionProvider.notifier).state = 'ur';
                },
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Continue',
                isEnabled: selectedLanguage != null,
                onPressed: selectedLanguage == null
                    ? null
                    : () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                            builder: (_) => const LoginPage(),
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
