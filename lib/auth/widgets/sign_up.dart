import 'package:chat_app/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Full Name field
          CustomTextField(text: 'Fullname'),
          SizedBox(height: 8),
          // Email text form field
          CustomTextField(text: 'Email Address'),
          SizedBox(height: 8),

          // password text form field
          CustomTextField(text: 'Password', obscureText: true),
          SizedBox(height: 8),

          CustomTextField(text: 'Confirm Password', obscureText: true),
          SizedBox(height: 12),
        ],
      ),
    );
    ;
  }
}
