import 'package:flutter/material.dart';

void main() {
  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Authentication App",
      home: null,
    );
  }
}