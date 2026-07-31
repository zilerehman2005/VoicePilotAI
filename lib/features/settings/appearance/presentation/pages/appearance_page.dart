import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../shared/widgets/cards/setting_tile.dart';
import '../../../../../shared/widgets/misc/section_header.dart';
import '../../../../../shared/widgets/navigation/top_app_bar.dart';
import '../providers/appearance_providers.dart';
import '../widgets/chat_preview_card.dart';
import '../widgets/theme_option_row.dart';

/// Appearance settings screen for theme selection and preview.
class AppearancePage extends ConsumerWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeModeOption selectedTheme = ref.watch(appearanceThemeModeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'Appearance',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [
                const _SectionLabel('Choose Theme'),
                for (final ThemeModeOption option
                    in ThemeModeOption.values) ...[
                  ThemeOptionRow(
                    label: _themeLabel(option),
                    selected: option == selectedTheme,
                    onTap: () => ref
                        .read(appearanceThemeModeProvider.notifier)
                        .state = option,
                  ),
                ],
                const SizedBox(height: AppSpacing.sm),
                SettingTile(
                  title: 'Use AMOLED Black',
                  icon: Icons.brightness_2_outlined,
                  showChevron: false,
                  trailing: Switch(
                    activeThumbColor: AppColors.primary,
                    activeTrackColor: AppColors.primary,
                    value: ref.watch(amoledBlackProvider),
                    onChanged: (bool value) =>
                        ref.read(amoledBlackProvider.notifier).state = value,
                  ),
                ),
                SettingTile(
                  title: 'Dynamic Colors',
                  icon: Icons.palette_outlined,
                  showChevron: false,
                  trailing: Switch(
                    activeThumbColor: AppColors.primary,
                    activeTrackColor: AppColors.primary,
                    value: ref.watch(dynamicColorsProvider),
                    onChanged: (bool value) =>
                        ref.read(dynamicColorsProvider.notifier).state = value,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const _SectionLabel('Preview'),
                const SizedBox(height: AppSpacing.xs),
                const ChatPreviewCard(),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _themeLabel(ThemeModeOption option) {
    switch (option) {
      case ThemeModeOption.system:
        return 'System';
      case ThemeModeOption.dark:
        return 'Dark';
      case ThemeModeOption.light:
        return 'Light';
    }
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
