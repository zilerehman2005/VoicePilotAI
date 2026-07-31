import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/gradient_card.dart';
import 'onboarding_footer.dart';

/// Onboarding page 2 for the 4-page intro flow.
class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key, this.onSkip, this.onNext});

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
                      final double artSize = constraints.maxWidth.clamp(
                        240.0,
                        340.0,
                      );

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
                                child: _ChatIllustration(size: artSize),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              'Instant Responses',
                              style: AppTypography.h2,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 320),
                              child: Text(
                                'Ask anything. Receive voice and text.',
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
              OnboardingFooter(activeIndex: 1, count: 4, onNext: onNext),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatIllustration extends StatelessWidget {
  const _ChatIllustration({required this.size});

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
            top: 12,
            left: 12,
            child: _GlowParticle(size: 10, opacity: 0.75),
          ),
          Positioned(
            top: 22,
            right: 18,
            child: _GlowParticle(size: 6, opacity: 0.55),
          ),
          Positioned(
            bottom: 16,
            left: 24,
            child: _GlowParticle(size: 8, opacity: 0.65),
          ),
          Positioned(
            top: size * 0.12,
            left: size * 0.08,
            child: _BubbleCard(
              width: size * 0.56,
              height: size * 0.28,
              align: BubbleAlign.left,
              withLines: true,
            ),
          ),
          Positioned(
            top: size * 0.34,
            right: size * 0.1,
            child: _BubbleCard(
              width: size * 0.48,
              height: size * 0.28,
              align: BubbleAlign.right,
              withDots: true,
            ),
          ),
          Positioned(
            bottom: size * 0.08,
            left: size * 0.23,
            child: _SpeakerGlyph(size: size * 0.22),
          ),
        ],
      ),
    );
  }
}

enum BubbleAlign { left, right }

class _BubbleCard extends StatelessWidget {
  const _BubbleCard({
    required this.width,
    required this.height,
    required this.align,
    this.withLines = false,
    this.withDots = false,
  });

  final double width;
  final double height;
  final BubbleAlign align;
  final bool withLines;
  final bool withDots;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        align == BubbleAlign.left ? 0 : 8,
        align == BubbleAlign.left ? -4 : 4,
      ),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryLight, AppColors.primaryDark],
          ),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.28),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: align == BubbleAlign.left ? 18 : null,
              right: align == BubbleAlign.right ? 18 : null,
              bottom: -10,
              child: Transform.rotate(
                angle: align == BubbleAlign.left ? -0.2 : 0.2,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                ),
              ),
            ),
            if (withLines)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BubbleLine(width: width * 0.48),
                  const SizedBox(height: 10),
                  _BubbleLine(width: width * 0.34),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: width * 0.16,
                      height: width * 0.16,
                      decoration: const BoxDecoration(
                        color: AppColors.textPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            if (withDots)
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.textPrimary,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BubbleLine extends StatelessWidget {
  const _BubbleLine({required this.width});

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

class _SpeakerGlyph extends StatelessWidget {
  const _SpeakerGlyph({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface.withOpacity(0.88),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 18),
        ],
      ),
      child: Icon(
        Icons.graphic_eq_rounded,
        color: AppColors.primaryLight,
        size: size * 0.42,
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
