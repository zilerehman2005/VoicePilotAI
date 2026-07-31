import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../shared/widgets/cards/setting_tile.dart';
import '../../../../../shared/widgets/navigation/top_app_bar.dart';
import '../providers/notifications_providers.dart';

/// Notifications settings screen with toggle switches per notification type.
class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> tiles = [
      SettingTile(
        title: 'Enable Notifications',
        showChevron: false,
        trailing: _ToggleSwitch(
          value: ref.watch(notificationsEnabledProvider),
          onChanged: (bool value) =>
              ref.read(notificationsEnabledProvider.notifier).state = value,
        ),
      ),
      SettingTile(
        title: 'Conversation Reminders',
        showChevron: false,
        trailing: _ToggleSwitch(
          value: ref.watch(conversationRemindersProvider),
          onChanged: (bool value) =>
              ref.read(conversationRemindersProvider.notifier).state = value,
        ),
      ),
      SettingTile(
        title: 'Daily AI Tips',
        showChevron: false,
        trailing: _ToggleSwitch(
          value: ref.watch(dailyAiTipsProvider),
          onChanged: (bool value) =>
              ref.read(dailyAiTipsProvider.notifier).state = value,
        ),
      ),
      SettingTile(
        title: 'Product Updates',
        showChevron: false,
        trailing: _ToggleSwitch(
          value: ref.watch(productUpdatesProvider),
          onChanged: (bool value) =>
              ref.read(productUpdatesProvider.notifier).state = value,
        ),
      ),
      SettingTile(
        title: 'Marketing Emails',
        showChevron: false,
        trailing: _ToggleSwitch(
          value: ref.watch(marketingEmailsProvider),
          onChanged: (bool value) =>
              ref.read(marketingEmailsProvider.notifier).state = value,
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'Notifications',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: tiles.length,
              separatorBuilder: (_, _) => const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.border,
                indent: AppSpacing.lg,
                endIndent: AppSpacing.lg,
              ),
              itemBuilder: (context, index) => tiles[index],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToggleSwitch extends StatelessWidget {
  const _ToggleSwitch({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeThumbColor: AppColors.primary,
      trackColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) =>
            states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.border,
      ),
    );
  }
}
