import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/To-do%20list/NotesFeature.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to NotesFeature when the container is tapped
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NotesPage()));
      },
      child: Container(
        height: 115,
        width: 147,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 207, 149, 72),
              Color.fromARGB(255, 158, 133, 52),
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
            Positioned(
              top: 13,
              left: 10,
              child: NotesCategory(),
            ),
            Positioned(
              top: 45,
              left: 13,
              child: NotesMainText(),
            ),
            Positioned(
              top: 68,
              left: 13,
              child: NotesSubText(),
            ),
            Positioned(
              top: 75,
              left: 100,
              child: NotesIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesCategory extends StatelessWidget {
  const NotesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.1),
      ),
      child: const Center(
        child: Text(
          "Reminders",
          style: TextStyle(
              color: Color.fromARGB(255, 241, 241, 241),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class NotesMainText extends StatelessWidget {
  const NotesMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "To-Do list",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class NotesSubText extends StatelessWidget {
  const NotesSubText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Click to write\nyour to-do list",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 214, 214, 214),
      ),
    );
  }
}

class NotesIcon extends StatelessWidget {
  const NotesIcon({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/notes.png',
      width: 45,
      height: 45,
      color: Colors.white,
    );
  }
}
