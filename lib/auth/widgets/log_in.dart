import 'package:flutter/material.dart';
import 'package:chat_app/auth/widgets/custom_text_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _obscureText = true;

  void passwordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void clearController() {
    widget.emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Email text form field
        CustomTextField(
          text: 'Email Address',
          icon: Icons.clear,
          onPressed: clearController,
          controller: widget.emailController,
          inputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.trim().isEmpty || !value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),

        const SizedBox(height: 8),

        // password text form field
        CustomTextField(
          text: 'Password',
          obscureText: _obscureText,
          onPressed: passwordVisibility,
          controller: widget.passwordController,
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
          validator: (value) {
            if (value == null || value.trim().length < 6) {
              return 'Password must be at least 6 characters long.';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
