import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../../shared/widgets/inputs/app_text_field.dart';
import '../../../../../shared/widgets/inputs/password_field.dart';

/// Sign up form with local field controllers and validation.
class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key, this.onSignUp, this.onLogin});

  final VoidCallback? onSignUp;
  final VoidCallback? onLogin;

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  late final TextEditingController _fullNameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _confirmPasswordController = TextEditingController();

  String? _fullNameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    setState(() {
      _fullNameError = _fullNameController.text.trim().isEmpty ? 'Full name is required' : null;
      _emailError = _emailController.text.trim().isEmpty ? 'Email is required' : null;
      _passwordError = _passwordController.text.trim().isEmpty ? 'Password is required' : null;
      _confirmPasswordError =
          _confirmPasswordController.text.trim().isEmpty ? 'Confirm your password' : null;

      if (_confirmPasswordError == null &&
          _passwordController.text.trim() != _confirmPasswordController.text.trim()) {
        _confirmPasswordError = 'Passwords do not match';
      }
    });

    if (_fullNameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      // TODO: submit sign up request.
      widget.onSignUp?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _fullNameController,
          labelText: 'Full Name',
          hintText: 'Enter your full name',
          errorText: _fullNameError,
        ),
        const SizedBox(height: AppSpacing.md),
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
          hintText: 'Create a password',
          errorText: _passwordError,
        ),
        const SizedBox(height: AppSpacing.md),
        AppPasswordField(
          controller: _confirmPasswordController,
          labelText: 'Confirm Password',
          hintText: 'Confirm your password',
          errorText: _confirmPasswordError,
        ),
        const SizedBox(height: AppSpacing.xl),
        PrimaryButton(
          label: 'Create Account',
          onPressed: _validateAndSubmit,
        ),
        const SizedBox(height: AppSpacing.md),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
              ),
              GestureDetector(
                onTap: widget.onLogin,
                child: Text(
                  'Login',
                  style: AppTypography.bodyMedium.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
