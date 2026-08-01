import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/inputs/search_bar.dart';
import '../../../../shared/widgets/misc/section_header.dart';
import '../../../../shared/widgets/navigation/top_app_bar.dart';
import '../../../../shared/widgets/states/empty_state_widget.dart';
import '../../../chat/presentation/pages/conversation_detail_page.dart';
import '../../../voice_assistant/presentation/pages/voice_listening_page.dart';
import '../../domain/entities/history_item_entity.dart';
import '../widgets/history_list_item.dart';

/// History screen listing past conversations grouped by date label.
class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
    this.title = 'History',
    this.groups = _defaultGroups,
  });

  final String title;
  final Map<String, List<HistoryItemEntity>> groups;

  static const Map<String, List<HistoryItemEntity>> _defaultGroups = {
    'Today': [
      HistoryItemEntity(
        id: '1',
        title: 'Explain Flutter in simple terms',
        timestamp: '10:30 AM',
      ),
      HistoryItemEntity(
        id: '2',
        title: 'What is the roadmap to AI?',
        timestamp: '09:15 AM',
      ),
    ],
    'Yesterday': [
      HistoryItemEntity(
        id: '3',
        title: 'Weather today in Lahore',
        timestamp: '04:15 PM',
      ),
      HistoryItemEntity(
        id: '4',
        title: 'Flutter Roadmap 2026',
        timestamp: '11:20 AM',
      ),
    ],
    'Last 7 Days': [
      HistoryItemEntity(
        id: '5',
        title: 'Write a poem about the ocean',
        timestamp: 'Tue',
      ),
      HistoryItemEntity(
        id: '6',
        title: 'Explain quantum computing in simple words',
        timestamp: 'Mon',
      ),
    ],
  };

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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

  void _openConversation(HistoryItemEntity item) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ConversationDetailPage(
          conversationId: item.id,
          title: item.title,
        ),
      ),
    );
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
                    hintText: 'Search conversations...',
                  ),
                ),
                Expanded(child: _buildGroupedList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGroupedList() {
    if (widget.groups.isEmpty) {
      return EmptyStateWidget(
        title: 'No conversations yet',
        subtitle: 'Tap the mic button to start your first conversation.',
        buttonLabel: 'Tap to Speak',
        onButtonTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const VoiceListeningPage()),
          );
        },
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      children: [
        for (final MapEntry<String, List<HistoryItemEntity>> group
            in widget.groups.entries) ...[
          if (group.value.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xs,
              ),
              child: SectionHeader(title: group.key),
            ),
            for (var i = 0; i < group.value.length; i++) ...[
              HistoryListItem(
                item: group.value[i],
                onTap: () => _openConversation(group.value[i]),
              ),
              if (i < group.value.length - 1)
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.border,
                  indent: 76,
                  endIndent: AppSpacing.lg,
                ),
            ],
            const SizedBox(height: AppSpacing.lg),
          ],
        ],
      ],
    );
  }
}
