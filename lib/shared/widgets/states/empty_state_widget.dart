import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../buttons/primary_button.dart';

const Color _accentGlow = Color(0x668B5CF6);
const Color _bubbleDotBright = Color(0xFFFFFFFF);
const Color _bubbleDotMid = Color(0xB3FFFFFF);
const Color _bubbleDotDim = Color(0x80FFFFFF);

/// Fully-parameterized shared empty state with illustration, title,
/// subtitle and an optional CTA button.
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    this.illustration,
    this.illustrationAsset,
    required this.title,
    this.subtitle,
    this.buttonLabel,
    this.onButtonTap,
  });

  /// Custom illustration widget. Defaults to the built-in robot mascot.
  final Widget? illustration;

  /// Optional illustration asset path; takes precedence over [illustration].
  final String? illustrationAsset;

  final String title;
  final String? subtitle;
  final String? buttonLabel;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    final Widget illustrationWidget = illustrationAsset != null
        ? Image.asset(
            illustrationAsset!,
            width: 140,
            height: 140,
            fit: BoxFit.contain,
          )
        : (illustration ?? const _RobotMascot());

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            illustrationWidget,
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: AppTypography.h3,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                subtitle!,
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (buttonLabel != null) ...[
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: 260,
                child: PrimaryButton(
                  label: buttonLabel!,
                  onPressed: onButtonTap,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Friendly robot mascot built from violet gradient shapes with two small
/// floating chat-bubble accents.
class _RobotMascot extends StatelessWidget {
  const _RobotMascot();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 4,
            left: 2,
            child: _ChatBubbleAccent(size: 34),
          ),
          Positioned(
            bottom: 18,
            right: 0,
            child: _ChatBubbleAccent(size: 24, dimmed: true),
          ),
          _RobotHead(),
        ],
      ),
    );
  }
}

class _ChatBubbleAccent extends StatelessWidget {
  const _ChatBubbleAccent({required this.size, this.dimmed = false});

  final double size;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final double dotSize = size * 0.13;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(size * 0.3),
        boxShadow: const [
          BoxShadow(color: _accentGlow, blurRadius: 12),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(size * 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BubbleDot(size: dotSize, color: dimmed ? _bubbleDotDim : _bubbleDotBright),
            SizedBox(width: size * 0.08),
            _BubbleDot(size: dotSize, color: _bubbleDotMid),
            SizedBox(width: size * 0.08),
            _BubbleDot(size: dotSize, color: _bubbleDotDim),
          ],
        ),
      ),
    );
  }
}

class _BubbleDot extends StatelessWidget {
  const _BubbleDot({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _RobotHead extends StatelessWidget {
  const _RobotHead();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      height: 104,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              width: 92,
              height: 82,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: _accentGlow,
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(left: 22, top: 30, child: _RobotEye()),
                  Positioned(right: 22, top: 30, child: _RobotEye()),
                  Positioned(
                    bottom: 18,
                    child: Container(
                      width: 24,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xE6FFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(999)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RobotEye extends StatelessWidget {
  const _RobotEye();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: const BoxDecoration(
        color: AppColors.textPrimary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
