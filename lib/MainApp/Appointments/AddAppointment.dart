import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/Calendar/Calendar.dart';

class AddAppointment extends StatelessWidget {
  const AddAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AppointmentCalendar()),
        );
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          gradient: const LinearGradient(
            colors: [
              Colors.blueAccent,
              Color.fromARGB(255, 93, 86, 226),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 46, 43, 104).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5), // Adjust the offset as needed
            ),
          ],
        ),
        child: const Stack(
          children: [
            Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
