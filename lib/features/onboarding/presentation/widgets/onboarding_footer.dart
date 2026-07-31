import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';

/// Shared onboarding footer with dots and next action.
class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.activeIndex,
    required this.count,
    this.onNext,
    this.buttonLabel = '',
    this.buttonIcon = Icons.arrow_forward_rounded,
    this.compactButton = true,
  });

  final int activeIndex;
  final int count;
  final VoidCallback? onNext;
  final String buttonLabel;
  final IconData buttonIcon;
  final bool compactButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PageIndicatorDots(activeIndex: activeIndex, count: count),
        const Spacer(),
        SizedBox(
          width: compactButton ? null : 148,
          child: PrimaryButton(
            label: buttonLabel,
            icon: buttonIcon,
            compact: compactButton,
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}

class _PageIndicatorDots extends StatelessWidget {
  const _PageIndicatorDots({
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (index) {
        final bool active = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 8),
          width: active ? 20 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: active ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
        );
      }),
    );
  }
}
