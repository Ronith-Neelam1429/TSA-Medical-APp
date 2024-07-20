import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/DailyCheckUpCard/SurveyP1.dart';

class DailyCheckUpCard extends StatelessWidget {
  const DailyCheckUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Survey()),
        );
      },
      child: Container(
        height: 115,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 207, 72, 72),
              Color.fromARGB(255, 128, 44, 62),
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
              child: DailyCheckUpCategory(),
            ),
            Positioned(
              top: 45,
              left: 13,
              child: DailyCheckUpMainText(),
            ),
            Positioned(
              top: 70,
              left: 13,
              child: DailyCheckUpSubText(),
            ),
            Positioned(
              top: 75,
              left: 89,
              child: DailyCheckUpIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyCheckUpCategory extends StatelessWidget {
  const DailyCheckUpCategory({Key? key}) : super(key: key);

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
          "Personal Care",
          style: TextStyle(
            color: Color.fromARGB(255, 241, 241, 241),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class DailyCheckUpMainText extends StatelessWidget {
  const DailyCheckUpMainText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Daily Check Up",
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class DailyCheckUpSubText extends StatelessWidget {
  const DailyCheckUpSubText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Click to take\nthe survey!",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 214, 214, 214),
      ),
    );
  }
}

class DailyCheckUpIcon extends StatelessWidget {
  const DailyCheckUpIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/holding-hand.png',
      width: 50,
      height: 50,
      color: Colors.white,
    );
  }
}
