import 'package:flutter/material.dart';
import 'package:chat_app/widgets/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/auth/widgets/log_in.dart';
import 'package:chat_app/auth/widgets/sign_up.dart';
import 'package:chat_app/auth/widgets/custom_button.dart';

final _auth = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  //switch to signUp and LogIn
  void _switchState() {
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  // Login method
  void _logInMethod() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    showCircularDialog(context: context, text: 'Connecting...');

    if (isValid) {
      _formKey.currentState!.save();
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        showErrorDialog(context: context, content: e.message!);
      }
    }
  }

  // Signup method
  void _signUpMethod() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    showCircularDialog(context: context, text: 'Connecting...');

    if (isValid) {
      _formKey.currentState!.save();
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        showErrorDialog(context: context, content: e.message!);
      }
    }
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _isLogin
                              ? LogIn(
                                  emailController: _emailController,
                                  passwordController: _passwordController,
                                )
                              : SignUp(
                                  confirmPasswordController:
                                      _confirmPasswordController,
                                  emailController: _emailController,
                                  passwordController: _passwordController,
                                  usernameController: _usernameController,
                                ),

                          // sign up button
                          CustomButton(
                            onPressed: _isLogin ? _logInMethod : _signUpMethod,
                            text: _isLogin ? 'Log in' : 'Sign up',
                          ),

                          // transition button
                          TextButton(
                            onPressed: _switchState,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
