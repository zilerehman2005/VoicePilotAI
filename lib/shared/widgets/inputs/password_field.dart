import 'package:flutter/material.dart';

import 'app_text_field.dart';

/// Password field with visibility toggle.
class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool enabled;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      errorText: widget.errorText,
      enabled: widget.enabled,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        onPressed: widget.enabled
            ? () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              }
            : null,
        icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
      ),
    );
  }
}
