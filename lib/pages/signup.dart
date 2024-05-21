// import 'package:chicart/components/Login_SignUp/confirm_password.dart';
// import 'package:chicart/components/Login_SignUp/email_field.dart';
// import 'package:chicart/components/Login_SignUp/password_fields.dart';
// import 'package:chicart/components/Login_SignUp/sigup_button.dart';
// import 'package:chicart/components/Login_SignUp/username.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200], // Set background color
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0), // Add padding
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo Image (replace with your actual image asset)
//               Image.asset(
//                 'assets/logo.png',
//                 height: 100,
//               ),
//               const SizedBox(height: 32.0),
//               // Username Fields
//               UserNameFields(),
//               const SizedBox(height: 8.0),
//               // Email Field
//               EmailField(),
//               const SizedBox(height: 8.0),
//               // Password Field
//               PasswordField(),
//               const SizedBox(height: 8.0),
//               // Confirm Password Field
//               ConfirmPasswordField(),
//               const SizedBox(height: 20.0),
//               // SignUp Button
//               SignUpButton(
//                 onPressed: () {},
//                 routeName: '/homepage',
//               ),
//               const SizedBox(height: 32.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Create new Accounts?',
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/loginpage');
//                     },
//                     child:
//                         const Text('Login', style: TextStyle(fontSize: 16.0)),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               // Social Login Buttons (Google and Facebook)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Image.asset(
//                       'assets/Google.png',
//                       height: 43,
//                       width: 43,
//                     ),
//                     onPressed: () {}, // Add Google login logic
//                   ),
//                   const SizedBox(width: 5.0),
//                   IconButton(
//                     icon: Image.asset(
//                       'assets/Facebook.png',
//                       height: 43,
//                       width: 43,
//                     ),
//                     onPressed: () {}, // Add Facebook login logic
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
