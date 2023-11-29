import 'package:chat_app/auth/widgets/custom_button.dart';
import 'package:chat_app/auth/widgets/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/auth/widgets/log_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;

  //switch to signUp and LogIn
  void switchState() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Chat image container
              Container(
                width: 200,
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Image.asset('assets/chat.png'),
              ),

              // Card for text form field
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _isLogin ? const LogIn() : const SignUp(),

                        // sign up button
                        CustomButton(
                          onPressed: () {},
                          text: _isLogin ? 'Log in' : 'Sign up',
                        ),

                        // transition button
                        TextButton(
                          onPressed: switchState,
                          child: Text(
                            _isLogin
                                ? 'Create an account'
                                : 'Already have an account',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
