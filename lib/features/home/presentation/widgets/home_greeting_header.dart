import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/avatars/profile_avatar.dart';

/// Greeting header widget for the Home Screen.
class HomeGreetingHeader extends StatelessWidget {
  const HomeGreetingHeader({
    super.key,
    required this.name,
    this.greeting = 'Good Morning',
    this.subtitle = 'How can I help you today?',
    this.onMenuTap,
    this.onProfileTap,
    this.avatarUrl,
    this.avatarAsset,
  });

  final String name;
  final String greeting;
  final String subtitle;
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;
  final String? avatarUrl;
  final String? avatarAsset;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onMenuTap,
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.textPrimary,
            size: 26,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$greeting,\n$name 👋',
                style: AppTypography.h2.copyWith(height: 1.15),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        GestureDetector(
          onTap: onProfileTap,
          child: ProfileAvatar(
            radius: 22,
            imageUrl: avatarUrl,
            assetPath: avatarAsset,
            initials: name.isNotEmpty ? name[0].toUpperCase() : 'U',
          ),
        ),
      ],
    );
  }
}
