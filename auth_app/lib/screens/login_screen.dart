import 'package:auth_app/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField( // input username
              controller: _usernameController,
              decoration: InputDecoration(
                label: Text("Username")
              ),
            ),
            TextField( // input password
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text("Password")
              ),
              obscureText: true,
            ),

            SizedBox(height: 20),

            ElevatedButton( // ob submit, authenticate with email and password
              onPressed: () async {
                try { 
                  // Attempt to authenticate the user with Firebase using email and password
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _usernameController.text, 
                    password: _passwordController.text
                    );
                  } on FirebaseAuthException catch (e) { 
                    // handle any errors returned by Firebase
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message ?? "Login failed")),
                    );
                  } catch (e) {
                    // handle any errors like network or runtime errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Network error. Please try again.")),
                    );
                  }
              }, 
              child: Text("Login")),

              // Sign up navigation link
              TextButton(
                onPressed: () {
                  Navigator.push( // navigate to sign up screen
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen()
                    )
                  );
                }, 
                child: Text("Sign Up")
              )
          ],
        ),
      ),
    );
  }
}