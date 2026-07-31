import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/core/theme/app_theme.dart';
import 'package:voicepilot_ai/features/chat/presentation/pages/conversation_detail_page.dart';
import 'package:voicepilot_ai/features/history/presentation/pages/history_page.dart';
import 'package:voicepilot_ai/features/home/presentation/pages/home_page.dart';
import 'package:voicepilot_ai/shared/widgets/navigation/bottom_nav_bar.dart';

void main() {
  testWidgets('Home -> History route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const HomePage()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(
      find.descendant(
        of: find.byType(BottomNavBar),
        matching: find.text('History'),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Search conversations...'), findsOneWidget);
    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Yesterday'), findsOneWidget);
    expect(find.text('Last 7 Days'), findsOneWidget);
  });

  testWidgets('History -> Conversation Detail route works', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark, home: const HistoryPage()),
    );

    await tester.tap(find.text('Explain Flutter in simple terms'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(
      find.text(
        'Can you give me a step-by-step roadmap to become a Flutter Developer in 2026?',
      ),
      findsOneWidget,
    );

    await tester.tap(
      find.descendant(
        of: find.byType(ConversationDetailPage),
        matching: find.byIcon(Icons.arrow_back_ios_new_rounded),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Search conversations...'), findsOneWidget);
  });
}
