import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/DailyCheckUpCard/SurveyP2.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final int _currentPage = 0;
  final int _numPages = 3; // Set the total number of pages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Your existing Positioned widgets
            const Positioned(
              top: 160,
              left: 50,
              child: Text(
                "     Welcome to the\ndaily check-up survey",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
            ),
            const Positioned(
              top: 250,
              left: 40,
              child: Text(
                "Get ready to answer a couple quick\n                    questions!  ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
             Positioned(
              top: 40,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(
                      20), // Increased padding to make the button bigger
                  decoration: const BoxDecoration(
                 
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 30, // Adjust the size of the icon if needed
                  ),
                ),
              ),
            ),
            Positioned(
              top: 360,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (_, __, ___) => const SurveyPageTwo(),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "LET'S GO",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Page indicator dots
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _numPages,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
