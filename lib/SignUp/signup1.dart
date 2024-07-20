import 'package:flutter/material.dart';

void main() {
  runApp(const SignUP1());
}

class SignUP1 extends StatelessWidget {
  const SignUP1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Color.fromARGB(255, 248, 220, 253), Color.fromARGB(255, 209, 234, 255)])),
            )
          ],
        ),
      ),
    );
  }
}
