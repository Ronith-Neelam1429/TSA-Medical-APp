import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/ToolBar/Vitals.dart'; // Import the Vitals.dart file

class VitalsCard extends StatelessWidget {
  const VitalsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Vitals.dart screen
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Vitals(
                    updateHeartRate: (double value) {},
                    updateStepsCount: (double value) {},
                    updateBloodSugarLevel: (value) {},
                  )),
        );
      },
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 141, 245, 196),
              Color.fromARGB(255, 52, 228, 187),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'images/vitals.png', // Replace 'assets/vitals_image.png' with your image path
            width: 65,
            height: 65,

          ),
        ),
      ),
    );
  }
}
