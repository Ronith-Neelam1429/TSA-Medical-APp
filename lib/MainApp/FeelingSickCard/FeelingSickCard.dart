import 'package:flutter/material.dart';

class FeelingSickCard extends StatelessWidget {
  const FeelingSickCard({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 68, 81, 255),
            Color.fromARGB(255, 117, 92, 226),
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
            top: 20,
            left: 10,
            child: FeelingSick(),
          ),
          Positioned(
            top: 60,
            left: 12,
            child: FeelingSickMainText(),
          ),
          Positioned(
            top: 90,
            left: 12,
            child: FeelingSickSubText(),
          ),
          Positioned(
            top: 135,
            left: 84,
            child: FeelingSickVirusIcon(),
          ),
        ],
      ),
    );
  }
}

class FeelingSick extends StatelessWidget {
  const FeelingSick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.1),
      ),
      child: const Center(
        child: Text(
          "Sickness",
          style: TextStyle(
              color: Color.fromARGB(255, 241, 241, 241),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class FeelingSickMainText extends StatelessWidget {
  const FeelingSickMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Feeling Sick?",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class FeelingSickSubText extends StatelessWidget {
  const FeelingSickSubText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Click to find out\nhow to treat it! ",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 214, 214, 214),
      ),
    );
  }
}

class FeelingSickVirusIcon extends StatelessWidget {
  const FeelingSickVirusIcon({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/virus.png',
      width: 140,
      height: 150,
      color: Colors.white,
    );
  }
}
