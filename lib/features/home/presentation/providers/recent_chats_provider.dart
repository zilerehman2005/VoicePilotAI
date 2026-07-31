import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/recent_chat_item.dart';

/// Default mock recent chats provider.
final recentChatsProvider = Provider<List<RecentChatItem>>((ref) {
  return const [
    RecentChatItem(
      id: '1',
      title: 'Explain Flutter in simple terms',
      timestamp: 'Today, 10:30 AM',
    ),
    RecentChatItem(
      id: '2',
      title: 'What is the roadmap to AI?',
      timestamp: 'Today, 09:15 AM',
    ),
    RecentChatItem(
      id: '3',
      title: 'Weather today in Lahore',
      timestamp: 'Yesterday, 08:45 PM',
    ),
  ];
});
