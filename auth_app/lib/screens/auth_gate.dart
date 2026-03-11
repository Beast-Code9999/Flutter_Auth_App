import 'package:auth_app/screens/home_screen.dart';
import 'package:auth_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Listens to Firebase Auth state changes in real time
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot) {
        // handle stream errors
        if ( snapshot.hasError ) {
          return Center(child: Text("Something went wrong!"));
        }
        // loading when auth state is resolving
        if ( snapshot.connectionState == ConnectionState.waiting ) {
          return CircularProgressIndicator();
        }
        // if has data i.e. non-null, it means logged in
        if ( snapshot.hasData ) {
          return HomeScreen();
        }
        // else log in
        return LoginScreen();
      }
    );
  }
}



