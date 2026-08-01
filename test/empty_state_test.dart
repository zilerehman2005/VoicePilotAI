import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/core/theme/app_theme.dart';
import 'package:voicepilot_ai/features/history/presentation/pages/history_page.dart';
import 'package:voicepilot_ai/features/saved/presentation/pages/saved_page.dart';
import 'package:voicepilot_ai/shared/widgets/states/empty_state_widget.dart';

void main() {
  testWidgets('EmptyStateWidget renders title, subtitle and CTA',
      (WidgetTester tester) async {
    var tapped = false;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.dark,
          home: Scaffold(
            body: EmptyStateWidget(
              title: 'No conversations yet',
              subtitle: 'Tap the mic button to start your first conversation.',
              buttonLabel: 'Tap to Speak',
              onButtonTap: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('No conversations yet'), findsOneWidget);
    expect(
      find.text('Tap the mic button to start your first conversation.'),
      findsOneWidget,
    );
    expect(find.text('Tap to Speak'), findsOneWidget);

    await tester.tap(find.text('Tap to Speak'));
    expect(tapped, isTrue);
  });

  testWidgets('History page shows empty state when there are no groups',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.dark,
          home: const HistoryPage(groups: {}),
        ),
      ),
    );

    expect(find.text('No conversations yet'), findsOneWidget);
    expect(find.text('Tap to Speak'), findsOneWidget);
  });

  testWidgets('Saved page shows empty state when there are no items',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.dark,
          home: const SavedPage(items: []),
        ),
      ),
    );

    expect(find.text('No saved items yet'), findsOneWidget);
    expect(find.text('Tap to Speak'), findsOneWidget);
  });
}
