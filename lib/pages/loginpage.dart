import 'package:chicart/components/Login_SignUp/email_field.dart';
import 'package:chicart/components/Login_SignUp/forgot_password_link.dart';
import 'package:chicart/components/Login_SignUp/login_button.dart';
import 'package:chicart/components/Login_SignUp/password_fields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Set background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image (replace with your actual image asset)
              Image.asset(
                'assets/logo.png',
                height: 100,
              ),
              const SizedBox(height: 32.0),
              // Email Field
              const EmailField(),
              const SizedBox(height: 16.0),
              // Password Field
              const PasswordField(),
              const SizedBox(height: 8.0),
              // Forget Password Link
              ForgotPasswordLink(
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              // Login Button
              LoginButton(
                onPressed: () {},
                routeName: '/homepage',
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create new Accounts?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child:
                        const Text('Sign Up', style: TextStyle(fontSize: 16.0)),
                  )
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
    );
  }
}
