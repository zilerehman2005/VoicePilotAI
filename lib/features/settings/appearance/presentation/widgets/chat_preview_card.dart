import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radius.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../shared/widgets/chat/chat_bubble.dart';

/// Illustrative preview of a user and AI message styled with theme colors.
class ChatPreviewCard extends StatelessWidget {
  const ChatPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: const [
          ChatBubble(
            message: 'What are the benefits of Flutter?',
            isUser: true,
          ),
          ChatBubble(
            message: 'Flutter enables fast, beautiful apps from a single codebase.',
            isUser: false,
          ),
        ],
      ),
    );
  }
}
