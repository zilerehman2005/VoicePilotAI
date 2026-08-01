import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/cards/setting_tile.dart';
import '../../../../shared/widgets/misc/section_header.dart';
import '../../../../shared/widgets/navigation/top_app_bar.dart';
import '../../../about/presentation/pages/about_page.dart';
import '../../appearance/presentation/pages/appearance_page.dart';
import '../../ai_model/presentation/pages/ai_model_page.dart';
import '../../notifications/presentation/pages/notifications_page.dart';
import '../../voice_settings/presentation/pages/voice_settings_page.dart';

/// Main Settings screen listing configurable app options.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'Settings',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [
                _buildSection('General', [
                  SettingTile(
                    title: 'General',
                    icon: Icons.settings_rounded,
                    onTap: () => _goToGeneral(context),
                  ),
                  SettingTile(
                    title: 'Appearance',
                    icon: Icons.dark_mode_outlined,
                    value: 'Dark',
                    onTap: () => _navigateTo(context, const AppearancePage()),
                  ),
                  SettingTile(
                    title: 'Language',
                    icon: Icons.language_rounded,
                    value: 'English',
                    onTap: () => _goToLanguage(context),
                  ),
                  SettingTile(
                    title: 'Voice',
                    icon: Icons.mic_rounded,
                    onTap: () => _navigateTo(context, const VoiceSettingsPage()),
                  ),
                  SettingTile(
                    title: 'AI Model',
                    icon: Icons.smart_toy_outlined,
                    onTap: () => _navigateTo(context, const AiModelPage()),
                  ),
                ]),
                const SizedBox(height: AppSpacing.lg),
                _buildSection('System', [
                  SettingTile(
                    title: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onTap: () => _navigateTo(context, const NotificationsPage()),
                  ),
                  SettingTile(
                    title: 'Privacy',
                    icon: Icons.lock_outline_rounded,
                    onTap: () => _goToPrivacy(context),
                  ),
                  SettingTile(
                    title: 'Account',
                    icon: Icons.person_outline_rounded,
                    onTap: () => _goToAccount(context),
                  ),
                  SettingTile(
                    title: 'About',
                    icon: Icons.info_outline_rounded,
                    onTap: () => _goToAbout(context),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
          child: SectionHeader(title: title),
        ),
        for (var i = 0; i < tiles.length; i++) ...[
          tiles[i],
          if (i < tiles.length - 1)
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.border,
              indent: 76,
              endIndent: AppSpacing.lg,
            ),
        ],
      ],
    );
  }
}

void _goToGeneral(BuildContext context) {
  // TODO: Navigate to the General settings screen.
}

void _goToLanguage(BuildContext context) {
  // TODO: Navigate to the Language settings screen.
}

void _goToPrivacy(BuildContext context) {
  // TODO: Navigate to the Privacy settings screen.
}

void _goToAccount(BuildContext context) {
  // TODO: Navigate to the Account settings screen.
}

void _goToAbout(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => const AboutPage()),
  );
}
