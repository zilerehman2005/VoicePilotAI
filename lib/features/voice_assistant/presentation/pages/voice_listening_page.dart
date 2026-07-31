import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../widgets/listening_orb_section.dart';
import '../widgets/voice_control_bar.dart';
import '../widgets/voice_status_header.dart';
import 'voice_response_page.dart';

/// Full-screen Voice Assistant Listening page.
class VoiceListeningPage extends StatelessWidget {
  const VoiceListeningPage({
    super.key,
    this.transcriptPreview = 'How can I become a Data Scientist?',
  });

  final String transcriptPreview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VoiceStatusHeader(
                statusText: 'Listening...',
                onBackTap: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: Center(
                  child: ListeningOrbSection(
                    transcript: transcriptPreview,
                  ),
                ),
              ),
              VoiceControlBar(
                onStopTap: () {
                  // Navigate to thinking/response screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (_) => const VoiceResponsePage(),
                    ),
                  );
                },
                onMicTap: () {
                  // Toggle state or submit listening
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (_) => const VoiceResponsePage(),
                    ),
                  );
                },
                onCancelTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}
