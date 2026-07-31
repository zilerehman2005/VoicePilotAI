import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

/// Chat bubble for user or AI messages, supports plain text or bullet lists.
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    this.isUser = false,
    this.timestamp,
    this.bullets = const [],
  });

  final String message;
  final bool isUser;
  final String? timestamp;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isUser ? AppColors.primary : AppColors.surface;
    final Alignment alignment = isUser ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            padding: const EdgeInsets.all(AppSpacing.md),
            constraints: const BoxConstraints(maxWidth: 320),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary)),
                if (bullets.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.sm),
                  for (final bullet in bullets)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '• $bullet',
                        style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
                      ),
                    ),
                ],
              ],
            ),
          ),
          if (timestamp != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(timestamp!, style: AppTypography.caption),
            ),
        ],
      ),
    );
  }
}
