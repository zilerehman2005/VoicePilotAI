import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// Shared top app bar with optional back, title, and trailing slot.
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
    this.centerTitle = false,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      leading: onBack == null
          ? null
          : IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: AppColors.textPrimary,
            ),
      title: Text(title, style: AppTypography.h3),
      actions: trailing == null ? null : [Padding(padding: const EdgeInsets.only(right: 12), child: trailing!)],
    );
  }
}
