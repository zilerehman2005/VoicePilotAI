/// Domain entity representing a recent chat preview on the Home screen.
class RecentChatItem {
  const RecentChatItem({
    required this.id,
    required this.title,
    required this.timestamp,
  });

  final String id;
  final String title;
  final String timestamp;
}
