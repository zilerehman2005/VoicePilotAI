import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/chat/chat_bubble.dart';
import '../../../../shared/widgets/states/empty_state_widget.dart';
import '../../domain/entities/chat_message_entity.dart';

/// Scrollable message list rendering ChatBubble widgets.
class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.messages,
    this.scrollController,
    this.onSpeakTap,
  });

  final List<ChatMessageEntity> messages;
  final ScrollController? scrollController;

  /// Triggered when the empty-state "Tap to Speak" button is pressed.
  final VoidCallback? onSpeakTap;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return EmptyStateWidget(
        title: 'No conversations yet',
        subtitle: 'Tap the mic button to start your first conversation.',
        buttonLabel: 'Tap to Speak',
        onButtonTap: onSpeakTap,
      );
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final ChatMessageEntity msg = messages[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(
            mainAxisAlignment:
                msg.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!msg.isUser) ...[
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.only(right: AppSpacing.xs, top: 4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    size: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
              Flexible(
                child: ChatBubble(
                  message: msg.text,
                  isUser: msg.isUser,
                  timestamp: msg.timestamp,
                  bullets: msg.bullets,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
