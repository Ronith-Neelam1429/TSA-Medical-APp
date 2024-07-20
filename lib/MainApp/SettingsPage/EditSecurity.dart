import 'package:flutter/material.dart';

class EditSecurity extends StatelessWidget {
  const EditSecurity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Icon(
              Icons.lock,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 20,
            left: 80,
            child: Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Icon(
              Icons.security,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 80,
            left: 80,
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Icon(
              Icons.description,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 140,
            left: 80,
            child: Text(
              'Terms Of Service',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
