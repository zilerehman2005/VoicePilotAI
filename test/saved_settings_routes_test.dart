import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/core/theme/app_theme.dart';
import 'package:voicepilot_ai/features/home/presentation/pages/home_page.dart';
import 'package:voicepilot_ai/features/saved/presentation/pages/saved_page.dart';
import 'package:voicepilot_ai/shared/widgets/navigation/bottom_nav_bar.dart';

void main() {
  testWidgets('Home -> Saved route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const HomePage()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(
      find.descendant(
        of: find.byType(BottomNavBar),
        matching: find.text('Saved'),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Search saved items...'), findsOneWidget);
    expect(find.text('Flutter Roadmap 2026'), findsOneWidget);
  });

  testWidgets('Saved star toggle updates local state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.dark, home: const SavedPage()),
    );

    expect(find.byIcon(Icons.star_rounded), findsNWidgets(3));
    expect(find.byIcon(Icons.star_border_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.star_rounded).first);
    await tester.pump();

    expect(find.byIcon(Icons.star_rounded), findsNWidgets(2));
    expect(find.byIcon(Icons.star_border_rounded), findsNWidgets(2));
  });

  testWidgets('Home menu -> Settings route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const HomePage()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('Dark'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('AI Model'), findsOneWidget);
  });
}
