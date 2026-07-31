import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';

/// Login screen header with title and subtitle.
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back', style: AppTypography.h1),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Login to continue',
          style: AppTypography.bodyMedium,
        ),
      ],
    );
  }
}
