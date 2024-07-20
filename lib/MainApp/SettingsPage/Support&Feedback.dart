import 'package:flutter/material.dart';

class SupportAndFeedback extends StatelessWidget {
  const SupportAndFeedback({Key? key}) : super(key: key);

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
              Icons.feedback,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 20,
            left: 80,
            child: Text(
              'Feedback',
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
              Icons.phone,
              size: 35,
              color:Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 80,
            left: 80,
            child: Text(
              'Contact Us',
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
              Icons.contact_support_sharp,
              size: 35,
              color: Color.fromARGB(255, 68, 102, 255),
            ),
          ),
          Positioned(
            top: 140,
            left: 80,
            child: Text(
              'Help and Support',
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
