import 'package:chat_app/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Email text form field
          CustomTextField(text: 'Email Address'),
          SizedBox(height: 8),

          // password text form field
          CustomTextField(text: 'Password', obscureText: true),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
