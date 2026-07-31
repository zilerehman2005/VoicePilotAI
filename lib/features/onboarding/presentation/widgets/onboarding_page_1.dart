import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/gradient_card.dart';
import 'onboarding_footer.dart';

/// Onboarding page 1 for the 4-page intro flow.
class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key, this.onSkip, this.onNext});

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
                                child: _OnboardingIllustration(size: artSize),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              'Talk Naturally',
                              style: AppTypography.h2,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 320),
                              child: Text(
                                'Use your voice to interact with AI effortlessly.',
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
                activeIndex: 0,
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

class _OnboardingIllustration extends StatelessWidget {
  const _OnboardingIllustration({required this.size});

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
            top: 18,
            left: 12,
            child: _GlowDot(size: 10, opacity: 0.75),
          ),
          Positioned(
            top: 26,
            right: 28,
            child: _GlowDot(size: 6, opacity: 0.55),
          ),
          Positioned(
            bottom: 28,
            left: 24,
            child: _GlowDot(size: 8, opacity: 0.65),
          ),
          Container(
            width: size * 0.52,
            height: size * 0.52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryLight.withOpacity(0.9),
                  AppColors.primaryDark.withOpacity(0.95),
                  AppColors.background.withOpacity(0.0),
                ],
                stops: const [0, 0.55, 1],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 24,
                  spreadRadius: 3,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 18,
            left: size * 0.22,
            child: Transform.rotate(
              angle: -0.1,
              child: Container(
                width: size * 0.3,
                height: size * 0.38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryLight,
                      AppColors.primaryDark,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size * 0.11,
                    height: size * 0.18,
                    decoration: BoxDecoration(
                      color: AppColors.surface.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: size * 0.08,
            bottom: size * 0.16,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: size * 0.35,
                height: size * 0.24,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.gradientEnd,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gradientEnd.withOpacity(0.3),
                      blurRadius: 18,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        width: size * 0.06,
                        height: size * 0.06,
                        decoration: const BoxDecoration(
                          color: AppColors.textPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 12,
                      child: Container(
                        width: size * 0.1,
                        height: size * 0.1,
                        decoration: BoxDecoration(
                          color: AppColors.surface.withOpacity(0.92),
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: size * 0.15,
            top: size * 0.2,
            child: Container(
              width: size * 0.36,
              height: size * 0.2,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface.withOpacity(0.92),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: size * 0.08,
                  height: size * 0.08,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowDot extends StatelessWidget {
  const _GlowDot({required this.size, required this.opacity});

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
