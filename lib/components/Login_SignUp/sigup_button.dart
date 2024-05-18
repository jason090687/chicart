import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? routeName;

  const SignUpButton(
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
      child: const Text('Sign Up', style: TextStyle(fontSize: 18.0)),
    );
  }
}
