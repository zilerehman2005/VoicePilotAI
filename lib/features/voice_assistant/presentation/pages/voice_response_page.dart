import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/ai/ai_orb.dart';
import '../widgets/answer_card.dart';
import '../widgets/listen_action_bar.dart';
import '../widgets/voice_status_header.dart';

enum VoiceResponseState { thinking, answered }

class VoiceResponsePage extends ConsumerStatefulWidget {
  const VoiceResponsePage({
    super.key,
    this.initialState = VoiceResponseState.answered,
  });

  final VoiceResponseState initialState;

  @override
  ConsumerState<VoiceResponsePage> createState() => _VoiceResponsePageState();
}

class _VoiceResponsePageState extends ConsumerState<VoiceResponsePage> {
  late VoiceResponseState _state;
  bool _isPlayingAudio = false;

  @override
  void initState() {
    super.initState();
    _state = widget.initialState;
  }

  void _toggleState() {
    setState(() {
      _state = _state == VoiceResponseState.thinking
          ? VoiceResponseState.answered
          : VoiceResponseState.thinking;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isThinking = _state == VoiceResponseState.thinking;
    final String statusText = isThinking ? 'Thinking...' : 'Response Ready';

    final String sampleIntro = 'To become a Data Scientist, follow these key steps:';
    final List<String> sampleSteps = [
      'Master Mathematics & Statistics fundamentals.',
      'Learn Python/R programming and key libraries (Pandas, NumPy, Scikit-learn).',
      'Understand Data Manipulation, Cleaning, and Visualization (Matplotlib, Seaborn).',
      'Build hands-on Machine Learning & AI projects.',
      'Create a portfolio on GitHub and participate in Kaggle competitions.',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            children: [
              VoiceStatusHeader(
                statusText: statusText,
                onBackTap: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 480),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: AppSpacing.md),
                          GestureDetector(
                            onTap: _toggleState,
                            child: AiOrb(
                              state: isThinking ? AiOrbState.thinking : AiOrbState.speaking,
                              size: isThinking ? 200 : 130,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          if (isThinking) ...[
                            Text(
                              'Analyzing query and generating response...',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            TextButton(
                              onPressed: _toggleState,
                              child: Text(
                                'Tap orb to preview answer',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.primaryLight,
                                ),
                              ),
                            ),
                          ] else ...[
                            AnswerCard(
                              introText: sampleIntro,
                              steps: sampleSteps,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              if (!isThinking) ...[
                ListenActionBar(
                  isPlaying: _isPlayingAudio,
                  onTap: () {
                    setState(() {
                      _isPlayingAudio = !_isPlayingAudio;
                    });
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
