import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/ToolBar/Medication.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Medication.dart screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Medication()),
        );
      },
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 253, 166, 166),
              const Color.fromARGB(255, 255, 102, 102),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'images/pills.png', // Replace 'assets/pills_image.png' with your image path
            width: 65,
            height: 65,

          ),
        ),
      ),
    );
  }
}
