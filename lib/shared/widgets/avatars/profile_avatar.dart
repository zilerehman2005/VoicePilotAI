import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';

/// Circular profile avatar with optional edit badge and fallback initials.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.initials,
    this.radius = 24,
    this.showEditBadge = false,
    this.onEditTap,
  });

  final String? imageUrl;
  final String? assetPath;
  final String? initials;
  final double radius;
  final bool showEditBadge;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    final ImageProvider? provider = imageUrl != null
        ? NetworkImage(imageUrl!)
        : assetPath != null
            ? AssetImage(assetPath!)
            : null;

    final Widget avatar = Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: provider == null ? AppColors.primaryGradient : null,
        boxShadow: AppShadows.card,
        color: provider == null ? null : AppColors.surface,
      ),
      child: ClipOval(
        child: provider != null
            ? Image(
                image: provider,
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
              )
            : Center(
                child: Text(
                  (initials ?? '').isEmpty ? '?' : initials!,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: radius * 0.7,
                  ),
                ),
              ),
      ),
    );

    if (!showEditBadge) {
      return avatar;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: onEditTap,
            child: Container(
              width: radius * 0.8,
              height: radius * 0.8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                size: 12,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
