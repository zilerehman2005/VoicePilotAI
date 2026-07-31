import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/core/theme/app_theme.dart';
import 'package:voicepilot_ai/features/settings/appearance/presentation/pages/appearance_page.dart';
import 'package:voicepilot_ai/features/settings/presentation/pages/settings_page.dart';
import 'package:voicepilot_ai/features/settings/voice_settings/presentation/pages/voice_settings_page.dart';

void main() {
  testWidgets('Settings -> Appearance route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const SettingsPage()),
      ),
    );

    await tester.tap(find.text('Appearance'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Choose Theme'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(AppearancePage),
        matching: find.text('System'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(AppearancePage),
        matching: find.text('Dark'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(AppearancePage),
        matching: find.text('Light'),
      ),
      findsOneWidget,
    );
    expect(find.text('Use AMOLED Black'), findsOneWidget);
    expect(find.text('Dynamic Colors'), findsOneWidget);
    expect(find.text('Preview'), findsOneWidget);
    expect(find.byType(Switch), findsNWidgets(2));

    await tester.tap(
      find.descendant(
        of: find.byType(AppearancePage),
        matching: find.byIcon(Icons.arrow_back_ios_new_rounded),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Settings -> Voice Settings route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const SettingsPage()),
      ),
    );

    await tester.tap(find.text('Voice'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Voice Language'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(VoiceSettingsPage),
        matching: find.text('English'),
      ),
      findsOneWidget,
    );
    expect(find.text('Voice Speed'), findsOneWidget);
    expect(find.text('Slow'), findsOneWidget);
    expect(find.text('Normal'), findsNWidgets(2));
    expect(find.text('Fast'), findsOneWidget);
    expect(find.text('Voice Pitch'), findsOneWidget);
    expect(find.text('Low'), findsOneWidget);
    expect(find.text('High'), findsOneWidget);
    expect(find.text('Voice Gender'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);

    await tester.tap(
      find.descendant(
        of: find.byType(VoiceSettingsPage),
        matching: find.text('English'),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.text('اردو').last);
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(
      find.descendant(
        of: find.byType(VoiceSettingsPage),
        matching: find.text('اردو'),
      ),
      findsOneWidget,
    );

    await tester.tap(
      find.descendant(
        of: find.byType(VoiceSettingsPage),
        matching: find.byIcon(Icons.arrow_back_ios_new_rounded),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Settings'), findsOneWidget);
  });
}
