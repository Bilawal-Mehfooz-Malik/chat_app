import 'package:flutter/material.dart';
import 'package:chat_app/auth/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.confirmPasswordController,
  });
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;

  void passwordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void clearController() {
    widget.emailController.clear();
  }

  void clearNameController() {
    widget.usernameController.clear();
  }

  // password getter for confirm password
  String get password => widget.passwordController.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full Username text form field
        CustomTextField(
          text: 'Username',
          icon: Icons.clear,
          onPressed: clearNameController,
          controller: widget.usernameController,
          validator: (value) {
            if (value == null || value.trim().length < 4) {
              return 'Username must be at least 4 characters long.';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),

        // Email text form field
        CustomTextField(
          text: 'Email Address',
          icon: Icons.clear,
          onPressed: clearController,
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.trim().isEmpty || !value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),

        // Password text form field
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
        const SizedBox(height: 8),

        // Confirm password text form field
        CustomTextField(
          text: 'Confirm Password',
          obscureText: _obscureText,
          onPressed: passwordVisibility,
          controller: widget.confirmPasswordController,
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
          validator: (value) {
            if (value == null || value.trim().length < 6) {
              return 'Password must be at least 6 characters long.';
            }
            if (value != password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
