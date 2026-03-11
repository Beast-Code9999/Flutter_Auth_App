import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton( // signout button
            onPressed: () {
              FirebaseAuth.instance.signOut();
            }, 
            icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Text("Welcome"), // once logged in, this is accessible
    );
  }
}