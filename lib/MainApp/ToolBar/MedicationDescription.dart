import 'package:flutter/material.dart';

class MedicationDescription extends StatelessWidget {
  const MedicationDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Medication",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }
}
