import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/avatars/profile_avatar.dart';
import '../../../../shared/widgets/cards/setting_tile.dart';
import '../../../../shared/widgets/navigation/top_app_bar.dart';

/// Profile screen showing user info and account actions.
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    this.name = 'Zille',
    this.email = 'zille@voicepilot.ai',
    this.avatarUrl,
    this.onEditProfileTap,
    this.onChangePasswordTap,
    this.onLanguageTap,
    this.onStorageTap,
    this.onLogoutTap,
    this.onEditAvatarTap,
  });

  final String name;
  final String email;
  final String? avatarUrl;
  final VoidCallback? onEditProfileTap;
  final VoidCallback? onChangePasswordTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onStorageTap;
  final VoidCallback? onLogoutTap;
  final VoidCallback? onEditAvatarTap;

  void _onEditProfile() {
    // TODO: Navigate to the Edit Profile screen.
  }

  void _onChangePassword() {
    // TODO: Navigate to the Change Password screen.
  }

  void _onLanguage() {
    // TODO: Navigate to the Language screen.
  }

  void _onStorage() {
    // TODO: Navigate to the Storage Usage screen.
  }

  void _onLogout() {
    // TODO: Sign out and navigate to the login screen.
  }

  void _onEditAvatar() {
    // TODO: Open the avatar picker.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: '',
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
                Center(
                  child: ProfileAvatar(
                    radius: 56,
                    imageUrl: avatarUrl,
                    initials: name.isNotEmpty ? name[0].toUpperCase() : 'U',
                    showEditBadge: true,
                    onEditTap: onEditAvatarTap ?? _onEditAvatar,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  name,
                  style: AppTypography.h2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  email,
                  style: AppTypography.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xl),
                _SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Edit Profile',
                      icon: Icons.edit_outlined,
                      onTap: onEditProfileTap ?? _onEditProfile,
                    ),
                    _CardDivider(),
                    SettingTile(
                      title: 'Change Password',
                      icon: Icons.lock_outline_rounded,
                      onTap: onChangePasswordTap ?? _onChangePassword,
                    ),
                    _CardDivider(),
                    SettingTile(
                      title: 'Language',
                      icon: Icons.language_rounded,
                      value: 'English',
                      onTap: onLanguageTap ?? _onLanguage,
                    ),
                    _CardDivider(),                    SettingTile(
                      title: 'Storage Usage',
                      icon: Icons.storage_rounded,
                      value: '120 MB',
                      onTap: onStorageTap ?? _onStorage,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                _SettingsCard(
                  children: [
                    SettingTile(
                      title: 'Logout',
                      icon: Icons.logout_rounded,
                      showChevron: false,
                      destructive: true,
                      onTap: onLogoutTap ?? _onLogout,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
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
