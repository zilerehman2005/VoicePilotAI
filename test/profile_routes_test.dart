import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/core/theme/app_theme.dart';
import 'package:voicepilot_ai/features/home/presentation/pages/home_page.dart';
import 'package:voicepilot_ai/shared/widgets/avatars/profile_avatar.dart';

void main() {
  testWidgets('Home -> Profile route works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(theme: AppTheme.dark, home: const HomePage()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.byType(ProfileAvatar));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('zille@voicepilot.ai'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Change Password'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Storage Usage'), findsOneWidget);
    expect(find.text('120 MB'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
  });
}
