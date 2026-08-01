import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/core/theme/app_theme.dart';
import 'package:voicepilot_ai/features/about/presentation/pages/about_page.dart';
import 'package:voicepilot_ai/features/settings/presentation/pages/settings_page.dart';

void main() {
  testWidgets('Settings -> About route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const SettingsPage()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));

    await tester.ensureVisible(find.text('About'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(find.text('About'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.byType(AboutPage), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(AboutPage),
        matching: find.text('VoicePilot AI'),
      ),
      findsOneWidget,
    );
    expect(find.text('Your Intelligent Voice Assistant'), findsOneWidget);
    expect(find.text('Version 1.0.0'), findsOneWidget);
    expect(find.text('Terms of Service'), findsOneWidget);
    expect(find.text('Privacy Policy'), findsOneWidget);
    expect(find.text('Open Source Licenses'), findsOneWidget);
    expect(find.text('Rate This App'), findsOneWidget);
    expect(find.text('Share App'), findsOneWidget);
  });
}
