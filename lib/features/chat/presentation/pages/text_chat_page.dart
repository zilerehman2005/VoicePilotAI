import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../voice_assistant/presentation/pages/voice_listening_page.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_message_list.dart';
import '../widgets/chat_top_bar.dart';

/// Interactive Text Chat page supporting message history and messaging input.
class TextChatPage extends ConsumerStatefulWidget {
  const TextChatPage({
    super.key,
    this.initialTitle = 'New Chat',
  });

  final String initialTitle;

  @override
  ConsumerState<TextChatPage> createState() => _TextChatPageState();
}

class _TextChatPageState extends ConsumerState<TextChatPage> {
  late final List<ChatMessageEntity> _messages = [
    const ChatMessageEntity(
      id: '1',
      text: 'Hello! How can I assist you today?',
      isUser: false,
      timestamp: '10:30 AM',
    ),
    const ChatMessageEntity(
      id: '2',
      text: 'What are the main benefits of using Flutter for mobile development?',
      isUser: true,
      timestamp: '10:31 AM',
    ),
    const ChatMessageEntity(
      id: '3',
      text: 'Flutter offers key advantages for modern app development:',
      isUser: false,
      timestamp: '10:31 AM',
      bullets: [
        'Single codebase for iOS, Android, Web, and Desktop',
        'Hot Reload for rapid UI development and prototyping',
        'Rich set of customizable Material 3 widgets',
        'High performance rendering engine',
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

    // Mock AI response delay
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() {
        _messages.add(
          ChatMessageEntity(
            id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
            text: 'I received your message: "$text". How else can I help you?',
            isUser: false,
            timestamp: 'Just now',
          ),
        );
      });
      _scrollToBottom();
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: ChatTopBar(
        title: widget.initialTitle,
        onBack: () => Navigator.of(context).pop(),
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
