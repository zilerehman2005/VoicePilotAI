import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../voice_assistant/presentation/pages/voice_listening_page.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_message_list.dart';
import '../widgets/chat_top_bar.dart';

/// Conversation Detail Page for viewing existing saved/history conversations.
class ConversationDetailPage extends ConsumerStatefulWidget {
  const ConversationDetailPage({
    super.key,
    required this.conversationId,
    this.title = 'Flutter Roadmap',
  });

  final String conversationId;
  final String title;

  @override
  ConsumerState<ConversationDetailPage> createState() =>
      _ConversationDetailPageState();
}

class _ConversationDetailPageState
    extends ConsumerState<ConversationDetailPage> {
  late final List<ChatMessageEntity> _messages = [
    const ChatMessageEntity(
      id: '101',
      text: 'Can you give me a step-by-step roadmap to become a Flutter Developer in 2026?',
      isUser: true,
      timestamp: 'Yesterday, 04:15 PM',
    ),
    const ChatMessageEntity(
      id: '102',
      text: 'Here is your comprehensive Flutter Roadmap:',
      isUser: false,
      timestamp: 'Yesterday, 04:16 PM',
      bullets: [
        'Dart Language Mastery (Async, Streams, Generics, OOP)',
        'Flutter Architecture & State Management (Riverpod, Bloc)',
        'Networking & REST APIs (Dio, Retrofit, JSON Serialization)',
        'Local Storage & Databases (Hive, Isar, Supabase)',
        'CI/CD, Testing & App Store Deployment',
      ],
    ),
  ];

  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessageEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          isUser: true,
          timestamp: 'Just now',
        ),
      );
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showOverflowMenu() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit_rounded, color: AppColors.textPrimary),
                title: Text('Rename Conversation', style: AppTypography.bodyMedium),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.share_rounded, color: AppColors.textPrimary),
                title: Text('Share Conversation', style: AppTypography.bodyMedium),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline_rounded, color: AppColors.error),
                title: Text('Delete Conversation', style: AppTypography.bodyMedium.copyWith(color: AppColors.error)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: ChatTopBar(
        title: widget.title,
        onBack: () => Navigator.of(context).pop(),
        onMenuTap: _showOverflowMenu,
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessageList(
              messages: _messages,
              scrollController: _scrollController,
              onSpeakTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const VoiceListeningPage(),
                  ),
                );
              },
            ),
          ),
          ChatInputBar(
            onSend: _sendMessage,
            onMicTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const VoiceListeningPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
