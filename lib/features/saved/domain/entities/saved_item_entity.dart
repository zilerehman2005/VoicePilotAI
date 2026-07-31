/// Domain entity representing a saved/favorited conversation on the Saved screen.
class SavedItemEntity {
  const SavedItemEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isSaved = true,
  });

  final String id;
  final String title;
  final String subtitle;
  final bool isSaved;
}
