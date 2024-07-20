import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/ToolBar/CameraScreen.dart';

class CameraCard extends StatelessWidget {
  const CameraCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CameraScreen.dart screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Camera()),
        );
      },
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 188, 200, 253),
              const Color.fromARGB(255, 130, 146, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'images/camera.png', // Replace 'assets/camera_image.png' with your image path
            width: 65,
            height: 65,
            
          ),
        ),
      ),
    );
  }
}
