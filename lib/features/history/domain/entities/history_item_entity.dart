/// Domain entity representing a single saved conversation in the History screen.
class HistoryItemEntity {
  const HistoryItemEntity({
    required this.id,
    required this.title,
    required this.timestamp,
  });

  final String id;
  final String title;
  final String timestamp;
}
