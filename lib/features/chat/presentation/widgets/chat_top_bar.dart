import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/navigation/top_app_bar.dart';

/// Custom top app bar for text chat screens.
class ChatTopBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatTopBar({
    super.key,
    this.title = 'New Chat',
    this.onBack,
    this.onMenuTap,
  });

  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onMenuTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TopAppBar(
      title: title,
      onBack: onBack ?? () => Navigator.of(context).pop(),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert_rounded, color: AppColors.textPrimary),
        onPressed: onMenuTap,
      ),
    );
  }
}
