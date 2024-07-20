import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/Calendar/Calendar.dart';

class AppointmentsNav extends StatelessWidget {
  const AppointmentsNav({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            const Text(
              "Upcoming Appointments",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {
                // Navigate to AppointmentCalendar when "SEE ALL" is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppointmentCalendar()),
                );
              },
              child: const Text(
                "SEE ALL",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color.fromARGB(255, 98, 92, 226),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
