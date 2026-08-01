import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/setting_tile.dart';
import '../../../../shared/widgets/navigation/top_app_bar.dart';
import '../../../splash/presentation/widgets/app_logo_mark.dart';

/// About screen with the app logo, info and legal/feedback links.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void _openTerms() {
    // TODO: Open the Terms of Service URL in a browser.
  }

  void _openPrivacyPolicy() {
    // TODO: Open the Privacy Policy URL in a browser.
  }

  void _openLicenses() {
    // TODO: Open the Open Source Licenses page.
  }

  void _rateApp() {
    // TODO: Open the store rating page.
  }

  void _shareApp() {
    // TODO: Open the share sheet.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'About',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              children: [
                const SizedBox(height: AppSpacing.sm),
                const Center(child: AppLogoMark(size: 110)),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'VoicePilot AI',
                  style: AppTypography.h2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Your Intelligent Voice Assistant',
                  style: AppTypography.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Version 1.0.0',
                  style: AppTypography.caption,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xl),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SettingTile(
                        title: 'Terms of Service',
                        icon: Icons.description_outlined,
                        onTap: _openTerms,
                      ),
                      const _CardDivider(),
                      SettingTile(
                        title: 'Privacy Policy',
                        icon: Icons.privacy_tip_outlined,
                        onTap: _openPrivacyPolicy,
                      ),
                      const _CardDivider(),
                      SettingTile(
                        title: 'Open Source Licenses',
                        icon: Icons.code_rounded,
                        onTap: _openLicenses,
                      ),
                      const _CardDivider(),
                      SettingTile(
                        title: 'Rate This App',
                        icon: Icons.star_outline_rounded,
                        onTap: _rateApp,
                      ),
                      const _CardDivider(),
                      SettingTile(
                        title: 'Share App',
                        icon: Icons.ios_share_rounded,
                        onTap: _shareApp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardDivider extends StatelessWidget {
  const _CardDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.border,
      indent: 76,
      endIndent: AppSpacing.lg,
    );
  }
}
