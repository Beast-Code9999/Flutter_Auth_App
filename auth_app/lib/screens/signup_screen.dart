import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
                  // Attempt to create a new user with email and password
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _usernameController.text, 
                    password: _passwordController.text
                    );

                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginScreen()
                    //   )
                    // );

                    Navigator.pop(context); // go back to auth gate after successful sign up, which handles the screen navigation

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
              child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}