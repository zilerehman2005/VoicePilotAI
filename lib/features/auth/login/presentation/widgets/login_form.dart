import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/app_typography.dart';
import '../../../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../../../shared/widgets/inputs/app_text_field.dart';
import '../../../../../../shared/widgets/inputs/password_field.dart';
import 'social_login_button.dart';

/// Login form with local field controllers and validation.
class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    super.key,
    this.onLogin,
    this.onGoogleLogin,
    this.onSignUp,
    this.onForgotPassword,
  });

  final VoidCallback? onLogin;
  final VoidCallback? onGoogleLogin;
  final VoidCallback? onSignUp;
  final VoidCallback? onForgotPassword;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    setState(() {
      _emailError = _emailController.text.trim().isEmpty ? 'Email is required' : null;
      _passwordError = _passwordController.text.trim().isEmpty ? 'Password is required' : null;
    });

    if (_emailError == null && _passwordError == null) {
      widget.onLogin?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _emailController,
          labelText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          errorText: _emailError,
        ),
        const SizedBox(height: AppSpacing.md),
        AppPasswordField(
          controller: _passwordController,
          labelText: 'Password',
          hintText: 'Enter your password',
          errorText: _passwordError,
        ),
        const SizedBox(height: AppSpacing.xs),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: widget.onForgotPassword,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(48, 28),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Forgot Password?',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PrimaryButton(label: 'Login', onPressed: _validateAndSubmit),
        const SizedBox(height: AppSpacing.sm),
        Center(child: Text('or', style: AppTypography.bodyMedium)),
        const SizedBox(height: AppSpacing.sm),
        SocialLoginButton(
          label: 'Continue with Google',
          onPressed: widget.onGoogleLogin,
        ),
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: widget.onSignUp,
                child: Text(
                  'Sign Up',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
