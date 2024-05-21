import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  ConfirmPasswordField({super.key});

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
