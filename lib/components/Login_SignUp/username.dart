import 'package:flutter/material.dart';

class UserNameFields extends StatelessWidget {
  UserNameFields({super.key});

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        hintText: 'Username',
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
