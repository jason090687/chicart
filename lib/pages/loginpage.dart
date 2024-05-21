// ignore_for_file: use_build_context_synchronously

import 'package:chicart/components/Login_SignUp/forgot_password_link.dart';
import 'package:chicart/components/Login_SignUp/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUser() async {
    // Show Dialog Circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Remove the loading circle
      Navigator.pop(context);

      // Show appropriate message based on the exception code
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple[200],
          content: const Text('User not found.'),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Set background color
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0), // Add padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  // Logo Image (replace with your actual image asset)
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 32.0),
                  // Email Field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Password Field
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key),
                      hintText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Forget Password Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Forget Password!'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Login Button
                  LoginButton(
                    onPressed: signUser,
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Create new Accounts?',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Sign Up',
                            style: TextStyle(fontSize: 16.0)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Social Login Buttons (Google and Facebook)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/Google.png',
                          height: 43,
                          width: 43,
                        ),
                        onPressed: () {}, // Add Google login logic
                      ),
                      const SizedBox(width: 5.0),
                      IconButton(
                        icon: Image.asset(
                          'assets/Facebook.png',
                          height: 43,
                          width: 43,
                        ),
                        onPressed: () {}, // Add Facebook login logic
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
