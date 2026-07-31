/// Domain entity representing an individual chat message in a conversation.
class ChatMessageEntity {
  const ChatMessageEntity({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.bullets = const [],
  });

  final String id;
  final String text;
  final bool isUser;
  final String timestamp;
  final List<String> bullets;
}
