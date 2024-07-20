import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
              Icons.person,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 20,
            left: 80,
            child: Text(
              'Your Account',
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
              Icons.verified,
              size: 35,
              color:Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 80,
            left: 80,
            child: Text(
              'Account Verification',
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
              Icons.palette,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 140,
            left: 80,
            child: Text(
              'App Appearance',
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
