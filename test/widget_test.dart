import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voicepilot_ai/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: VoicePilotApp()));
    expect(find.text('VoicePilot AI'), findsOneWidget);
  });
}
