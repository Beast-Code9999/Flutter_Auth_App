import 'package:auth_app/firebase_options.dart';
import 'package:auth_app/screens/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Authentication App",
      home: AuthGate(), // Home is linked to AuthGate
    );
  }
}