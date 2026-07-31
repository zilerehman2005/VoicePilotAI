import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../onboarding/presentation/pages/onboarding_page.dart';
import '../controllers/splash_controller.dart';
import '../widgets/app_logo_mark.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 7),
  )..repeat();

  @override
  void initState() {
    super.initState();
    ref.read(splashControllerProvider).start(() {
      if (!mounted) {
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => const OnboardingPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double cardHeight = math.max(
              0,
              constraints.maxHeight - (AppSpacing.lg * 2),
            );

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 420,
                    maxHeight: cardHeight,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.xl,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background.withOpacity(0.86),
                      borderRadius: BorderRadius.circular(AppRadius.xl),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: AppSpacing.sm),
                        const Spacer(flex: 3),
                        _AnimatedOrbBackground(
                          controller: _rotationController,
                          child: const AppLogoMark(size: 220),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          'VoicePilot AI',
                          style: AppTypography.h1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Your Intelligent Voice Assistant',
                          style: AppTypography.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        const _LinearLoadingBar(),
                        const Spacer(flex: 4),
                        Text('Version 1.0.0', style: AppTypography.caption),
                        const SizedBox(height: AppSpacing.sm),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AnimatedOrbBackground extends StatelessWidget {
  const _AnimatedOrbBackground({
    required this.controller,
    required this.child,
  });

  final AnimationController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final double rotationTurns = controller.value;
        final double pulse =
            0.96 + (math.sin(controller.value * math.pi * 2) * 0.04);

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.orbGlow,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.18),
                    blurRadius: 42,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
            Transform.rotate(
              angle: rotationTurns * 2 * math.pi,
              child: Transform.scale(
                scale: pulse,
                child: child,
              ),
            ),
            _OrbRing(
              size: 246,
              opacity: 0.22,
              rotation: rotationTurns,
            ),
            _OrbRing(
              size: 286,
              opacity: 0.12,
              rotation: 1 - rotationTurns,
            ),
          ],
        );
      },
    );
  }
}

class _OrbRing extends StatelessWidget {
  const _OrbRing({
    required this.size,
    required this.opacity,
    required this.rotation,
  });

  final double size;
  final double opacity;
  final double rotation;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation * 2 * math.pi,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryLight.withOpacity(opacity),
            width: 1.2,
          ),
        ),
      ),
    );
  }
}

class _LinearLoadingBar extends StatelessWidget {
  const _LinearLoadingBar();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return AppColors.primaryGradient.createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: const ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.pill)),
        child: SizedBox(
          height: 5,
          child: LinearProgressIndicator(
            minHeight: 5,
            backgroundColor: AppColors.surfaceAlt,
          ),
        ),
      ),
    );
  }
}
