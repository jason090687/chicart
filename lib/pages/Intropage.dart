import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/intro_img.png'),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      'EXPLORE\nTHE BEST PRODUCTS',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: const Color.fromRGBO(211, 140, 92, 100)),
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginpage');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
