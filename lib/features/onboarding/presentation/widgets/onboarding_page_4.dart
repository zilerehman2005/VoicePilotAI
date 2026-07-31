import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/gradient_card.dart';
import 'onboarding_footer.dart';

/// Onboarding page 4 for the 4-page intro flow.
class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key, this.onSkip, this.onNext});

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
                                child: _SecurityIllustration(size: artSize),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              'Secure & Private',
                              style: AppTypography.h2,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 320),
                              child: Text(
                                'Your data is encrypted and always protected.',
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
                activeIndex: 3,
                count: 4,
                onNext: () {
                  // TODO: navigate to Choose Language screen with go_router.
                  onNext?.call();
                },
                buttonLabel: 'Get Started',
                buttonIcon: Icons.arrow_forward_rounded,
                compactButton: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecurityIllustration extends StatelessWidget {
  const _SecurityIllustration({required this.size});

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
            left: 18,
            child: _GlowParticle(size: 10, opacity: 0.75),
          ),
          Positioned(
            top: 26,
            right: 16,
            child: _GlowParticle(size: 7, opacity: 0.55),
          ),
          Positioned(
            bottom: 18,
            left: 24,
            child: _GlowParticle(size: 8, opacity: 0.65),
          ),
          Container(
            width: size * 0.5,
            height: size * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryLight.withOpacity(0.95),
                  AppColors.primaryDark.withOpacity(0.92),
                  AppColors.background.withOpacity(0.0),
                ],
                stops: const [0, 0.6, 1],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.34),
                  blurRadius: 28,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
          Container(
            width: size * 0.34,
            height: size * 0.42,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryLight,
                  AppColors.primaryDark,
                ],
              ),
              borderRadius: BorderRadius.circular(size * 0.09),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: size * 0.1,
                  child: Container(
                    width: size * 0.18,
                    height: size * 0.18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surface.withOpacity(0.9),
                      border: Border.all(color: AppColors.textPrimary.withOpacity(0.18)),
                    ),
                    child: Center(
                      child: Container(
                        width: size * 0.08,
                        height: size * 0.08,
                        decoration: const BoxDecoration(
                          color: AppColors.textPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size * 0.16,
                  child: Container(
                    width: size * 0.08,
                    height: size * 0.12,
                    decoration: BoxDecoration(
                      color: AppColors.surface.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: size * 0.12,
            bottom: size * 0.18,
            child: Container(
              width: size * 0.2,
              height: size * 0.1,
              decoration: BoxDecoration(
                color: AppColors.primaryDark.withOpacity(0.6),
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
          ),
          Positioned(
            left: size * 0.2,
            bottom: size * 0.12,
            child: Container(
              width: size * 0.32,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.primaryDark.withOpacity(0.4),
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
          ),
        ],
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

