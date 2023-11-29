import 'package:flutter/material.dart';
import 'package:chat_app/auth/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: const ButtonStyle().copyWith(
            backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.primaryContainer),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: const AuthScreen(),
    );
  }
}
