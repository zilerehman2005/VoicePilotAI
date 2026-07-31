import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/navigation/bottom_nav_bar.dart';
import '../../../chat/presentation/pages/conversation_detail_page.dart';
import '../../../chat/presentation/pages/text_chat_page.dart';
import '../../../history/presentation/pages/history_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../saved/presentation/pages/saved_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../../voice_assistant/presentation/pages/voice_assistant_page.dart';
import '../../domain/entities/recent_chat_item.dart';
import '../providers/recent_chats_provider.dart';
import '../widgets/home_greeting_header.dart';
import '../widgets/home_quick_actions.dart';
import '../widgets/home_voice_trigger.dart';
import '../widgets/recent_chats_section.dart';

/// Assembled Home Page with Riverpod sample data and BottomNavBar integration.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentNavIndex = 0;
  int _activeQuickActionIndex = 2; // Default active (e.g. History highlighted)

  void _onNavTap(int index) {
    if (index == _currentNavIndex) return;

    setState(() {
      _currentNavIndex = index;
    });

    switch (index) {
      case 0:
        // Already on Home
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const TextChatPage()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const HistoryPage()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const SavedPage()),
        );
        break;
    }
  }

  void _navigateToVoiceAssistant() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const VoiceAssistantPage()),
    );
  }

  void _navigateToChat() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const TextChatPage()),
    );
  }

  void _navigateToConversation(RecentChatItem chatItem) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ConversationDetailPage(
          conversationId: chatItem.id,
          title: chatItem.title,
        ),
      ),
    );
  }

  void _navigateToHistory() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const HistoryPage()),
    );
  }

  void _navigateToSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const SavedPage()),
    );
  }

  void _navigateToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const ProfilePage()),
    );
  }

  void _navigateToSettings() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recentChats = ref.watch(recentChatsProvider);

    final List<QuickActionItem> quickActions = [
      QuickActionItem(
        icon: Icons.mic_rounded,
        label: 'Voice Chat',
        isActive: _activeQuickActionIndex == 0,
        onTap: () {
          setState(() => _activeQuickActionIndex = 0);
          _navigateToVoiceAssistant();
        },
      ),
      QuickActionItem(
        icon: Icons.chat_bubble_outline_rounded,
        label: 'Text Chat',
        isActive: _activeQuickActionIndex == 1,
        onTap: () {
          setState(() => _activeQuickActionIndex = 1);
          _navigateToChat();
        },
      ),
      QuickActionItem(
        icon: Icons.history_rounded,
        label: 'History',
        isActive: _activeQuickActionIndex == 2,
        onTap: () {
          setState(() => _activeQuickActionIndex = 2);
          _navigateToHistory();
        },
      ),
      QuickActionItem(
        icon: Icons.bookmark_border_rounded,
        label: 'Saved',
        isActive: _activeQuickActionIndex == 3,
        onTap: () {
          setState(() => _activeQuickActionIndex = 3);
          _navigateToSaved();
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: _onNavTap,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HomeGreetingHeader(
                        name: 'Zille',
                        onMenuTap: _navigateToSettings,
                        onProfileTap: _navigateToProfile,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      HomeVoiceTrigger(
                        onTap: _navigateToVoiceAssistant,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      HomeQuickActions(
                        actions: quickActions,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      RecentChatsSection(
                        chats: recentChats,
                        onSeeAllTap: _navigateToHistory,
                        onItemTap: (chatItem) {
                          _navigateToConversation(chatItem);
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
