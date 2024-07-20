import 'package:flutter/material.dart';
import 'package:tsa_medapp/Login/login.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the Login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Login()), // Replace current screen with Login
        );
      },
      child: Container(
        height: 50,
        width: 290,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 185, 78, 78),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        child: const Text(
          'Logout',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
