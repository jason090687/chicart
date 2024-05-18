import 'package:chicart/pages/Intropage.dart';
import 'package:chicart/pages/homepage.dart';
import 'package:chicart/pages/loginpage.dart';
import 'package:chicart/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const IntroPage(), // IntroPage as the initial screen
        '/loginpage': (context) => const LoginPage(),
        '/sign_up': (context) => const SignUpPage(),
        '/homepage': (context) => const ProductListPage(),
      },
    );
  }
}
