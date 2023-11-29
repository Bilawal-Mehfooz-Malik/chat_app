import 'package:flutter/material.dart';
import 'package:chat_app/auth/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  // password getter for confirm password
  String get password => _passwordController.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full Username text form field
        CustomTextField(
          text: 'Username',
          controller: _usernameController,
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
          controller: _emailController,
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
          obscureText: true,
          controller: _passwordController,
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
          obscureText: true,
          controller: _confirmPasswordController,
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
