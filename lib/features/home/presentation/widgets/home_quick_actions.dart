import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Data class representing an individual quick action item.
class QuickActionItem {
  const QuickActionItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
}

/// Quick actions row displayed on the Home Screen.
class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({
    super.key,
    required this.actions,
  });

  final List<QuickActionItem> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: actions.map((action) {
        return Flexible(
          child: GestureDetector(
            onTap: action.onTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: action.isActive
                        ? AppColors.primary
                        : AppColors.surface,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: action.isActive
                          ? AppColors.primaryLight
                          : AppColors.border,
                      width: 1,
                    ),
                    boxShadow: action.isActive
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.35),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                  child: Icon(
                    action.icon,
                    color: AppColors.textPrimary,
                    size: 24,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  action.label,
                  style: AppTypography.caption.copyWith(
                    color: action.isActive
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight: action.isActive
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
