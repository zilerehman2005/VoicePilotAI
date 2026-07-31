import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/gradient_card.dart';
import 'onboarding_footer.dart';

/// Onboarding page 3 for the 4-page intro flow.
class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key, this.onSkip, this.onNext});

  final VoidCallback? onSkip;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: onSkip,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textSecondary,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(48, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('Skip', style: AppTypography.bodyMedium),
              ),
              const SizedBox(height: AppSpacing.sm),
              Expanded(
                child: Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double artSize = constraints.maxWidth.clamp(240.0, 340.0);

                      return ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 420),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: GradientCard(
                                useRadialGlow: true,
                                padding: const EdgeInsets.all(AppSpacing.lg),
                                child: _HistoryIllustration(size: artSize),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              'Everything Saved',
                              style: AppTypography.h2,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 320),
                              child: Text(
                                'Continue conversations whenever you want.',
                                style: AppTypography.bodyMedium,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              OnboardingFooter(
                activeIndex: 2,
                count: 4,
                onNext: onNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryIllustration extends StatelessWidget {
  const _HistoryIllustration({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 0.82,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 10,
            right: 18,
            child: _GlowParticle(size: 10, opacity: 0.75),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            child: _GlowParticle(size: 7, opacity: 0.55),
          ),
          Positioned(
            top: size * 0.1,
            left: size * 0.08,
            child: _ConversationCard(
              width: size * 0.6,
              height: size * 0.23,
              elevated: false,
            ),
          ),
          Positioned(
            top: size * 0.33,
            left: size * 0.12,
            child: _ConversationCard(
              width: size * 0.6,
              height: size * 0.23,
              elevated: true,
            ),
          ),
          Positioned(
            right: size * 0.08,
            bottom: size * 0.18,
            child: _ClockGlyph(size: size * 0.24),
          ),
          Positioned(
            left: size * 0.1,
            bottom: size * 0.12,
            child: _TimelineBase(width: size * 0.42),
          ),
        ],
      ),
    );
  }
}

class _ConversationCard extends StatelessWidget {
  const _ConversationCard({
    required this.width,
    required this.height,
    required this.elevated,
  });

  final double width;
  final double height;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryLight,
            AppColors.primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(elevated ? 0.34 : 0.24),
            blurRadius: elevated ? 22 : 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.18,
            height: width * 0.18,
            decoration: const BoxDecoration(
              color: AppColors.textPrimary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ConversationLine(width: width * 0.44),
                const SizedBox(height: 8),
                _ConversationLine(width: width * 0.26),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversationLine extends StatelessWidget {
  const _ConversationLine({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    );
  }
}

class _ClockGlyph extends StatelessWidget {
  const _ClockGlyph({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface.withOpacity(0.88),
        border: Border.all(color: AppColors.primaryLight.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.22),
            blurRadius: 18,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size * 0.72,
            height: size * 0.72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryLight.withOpacity(0.4), width: 2),
            ),
          ),
          Container(
            width: 2,
            height: size * 0.22,
            color: AppColors.textPrimary,
          ),
          Transform.rotate(
            angle: 1.1,
            child: Container(
              width: 2,
              height: size * 0.14,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineBase extends StatelessWidget {
  const _TimelineBase({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 14,
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.35),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    );
  }
}

class _GlowParticle extends StatelessWidget {
  const _GlowParticle({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryLight.withOpacity(opacity),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryLight.withOpacity(opacity * 0.55),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
