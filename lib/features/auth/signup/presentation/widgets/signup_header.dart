import 'package:flutter/material.dart';

import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';

/// Sign up screen header with title and subtitle.
class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Account', style: AppTypography.h1),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Sign up to get started',
          style: AppTypography.bodyMedium,
        ),
      ],
    );
  }
}
