import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/saved_item_entity.dart';

/// Tappable row for a single saved conversation with a star toggle.
class SavedListItem extends StatefulWidget {
  const SavedListItem({
    super.key,
    required this.item,
    this.onTap,
  });

  final SavedItemEntity item;
  final VoidCallback? onTap;

  @override
  State<SavedListItem> createState() => _SavedListItemState();
}

class _SavedListItemState extends State<SavedListItem> {
  late bool _isSaved = widget.item.isSaved;

  void _toggleSaved() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 18,
                color: AppColors.primaryLight,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: AppTypography.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.item.subtitle,
                    style: AppTypography.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            InkWell(
              onTap: _toggleSaved,
              customBorder: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xs),
                child: Icon(
                  _isSaved ? Icons.star_rounded : Icons.star_border_rounded,
                  size: 22,
                  color: _isSaved ? AppColors.starGold : AppColors.textTertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
