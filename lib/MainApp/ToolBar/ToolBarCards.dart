import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/ToolBar/Medication.dart';
import 'package:tsa_medapp/MainApp/ToolBar/Vitals.dart'; // Import the Vitals.dart file

class ToolBarCards extends StatelessWidget {
  const ToolBarCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 249),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to Vitals() screen
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
                    child: _buildContainerWithText(
                      'images/vitals.png',
                      'Vitals',
                      color: const Color.fromARGB(255, 128, 243, 189),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Medication()),
                      );
                    },
                    child: _buildContainerWithText(
                      'images/pills.png',
                      'Your Medication',
                      color: const Color.fromARGB(255, 253, 166, 166),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithText(String imagePath, String text,
      {required Color color}) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          margin: const EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                imagePath,
                color: const Color.fromARGB(255, 0, 0, 0),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
