import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/presentation/pages/splash_page.dart';

class VoicePilotApp extends StatelessWidget {
  const VoicePilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoicePilot AI',
      theme: AppTheme.dark,
      home: const SplashPage(),
    );
  }
}
