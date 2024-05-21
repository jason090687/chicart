import 'package:chicart/pages/auth_page.dart';
import 'package:chicart/pages/homepage.dart';
import 'package:chicart/pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/loginpage': (context) => LoginPage(),
        // '/sign_up': (context) => const SignUpPage(),
        '/homepage': (context) => const ProductListPage(),
      },
    );
  }
}
