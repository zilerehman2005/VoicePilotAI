import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/inputs/search_bar.dart';
import '../../../../shared/widgets/navigation/top_app_bar.dart';
import '../../domain/entities/saved_item_entity.dart';
import '../widgets/saved_list_item.dart';

/// Saved screen listing favorited conversations as an ungrouped list.
class SavedPage extends StatefulWidget {
  const SavedPage({
    super.key,
    this.title = 'Saved',
    this.items = _defaultItems,
  });

  final String title;
  final List<SavedItemEntity> items;

  static const List<SavedItemEntity> _defaultItems = [
    SavedItemEntity(
      id: '1',
      title: 'Flutter Roadmap 2026',
      subtitle: '12 May',
    ),
    SavedItemEntity(
      id: '2',
      title: 'Explain quantum computing in simple words',
      subtitle: 'Yesterday, 08:45 PM',
    ),
    SavedItemEntity(
      id: '3',
      title: 'Best practices for state management',
      subtitle: '10 May',
    ),
    SavedItemEntity(
      id: '4',
      title: 'AI in everyday life',
      subtitle: '08 May',
      isSaved: false,
    ),
  ];

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  late final TextEditingController _searchController = TextEditingController();
  late final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _focusSearch() {
    _searchFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: widget.title,
        onBack: () => Navigator.of(context).pop(),
        trailing: IconButton(
          onPressed: _focusSearch,
          icon: const Icon(Icons.search_rounded, color: AppColors.textPrimary),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    0,
                    AppSpacing.lg,
                    AppSpacing.md,
                  ),
                  child: SearchBarField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    hintText: 'Search saved items...',
                  ),
                ),
                Expanded(child: _buildList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    if (widget.items.isEmpty) {
      return const Center(
        child: Text(
          'No saved items yet.',
          style: TextStyle(color: AppColors.textTertiary),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      itemCount: widget.items.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        thickness: 1,
        color: AppColors.border,
        indent: 76,
        endIndent: AppSpacing.lg,
      ),
      itemBuilder: (context, index) {
        return SavedListItem(item: widget.items[index]);
      },
    );
  }
}
