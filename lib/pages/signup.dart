// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigUpPage extends StatefulWidget {
  final Function()? onTap;
  const SigUpPage({super.key, required this.onTap});

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

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
      if (passwordController.text == confirmpasswordController.text) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.email)
            .set({
          'username': emailController.text.split('@')[0],
        });
      } else {
        showErrorMessage('Password did\nt Match!');
      }

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
                  const SizedBox(height: 8.0),
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
                  TextField(
                    controller: confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key),
                      hintText: 'Confirm password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Login Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    onPressed: () {
                      signUser();
                    },
                    child:
                        const Text('Sign Up', style: TextStyle(fontSize: 18.0)),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an Accounts?',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Login',
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
