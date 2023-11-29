import 'package:chat_app/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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

        // password text form field
        CustomTextField(
          text: 'Password',
          obscureText: true,
          controller: _passwordController,
          validator: (value) {
            if (value != null || value.trim().length < 6) {
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
