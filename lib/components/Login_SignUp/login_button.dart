import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? routeName;

  const LoginButton(
      {super.key, required this.onPressed, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, routeName!);
      },
      child: const Text('Login', style: TextStyle(fontSize: 18.0)),
    );
  }
}
