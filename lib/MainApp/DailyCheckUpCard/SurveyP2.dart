import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/DailyCheckUpCard/SurveyP3.dart';

class SurveyPageTwo extends StatefulWidget {
  const SurveyPageTwo({Key? key}) : super(key: key);

  @override
  _SurveyPageTwoState createState() => _SurveyPageTwoState();
}

class _SurveyPageTwoState extends State<SurveyPageTwo> {
  final int _currentPage = 1; // Set initial current page index to 2 (zero-based index)
  final int _numPages = 3; // Set the total number of pages

  // Track the selected feeling
  String _selectedFeeling = '';

  // Function to update the selected feeling
  void _updateSelectedFeeling(String feeling) {
    setState(() {
      _selectedFeeling = feeling;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            const Positioned(
              top: 120,
              left: 30,
              child: Text(
                "     How are you feeling?\nHave you been feeling sick?",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              top: 240,
              left: 0,
              child: Container(
                height: 3,
                width: 380,
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
            ),
            // I'm feeling great!
            Positioned(
              top: 260,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  _updateSelectedFeeling("great");
                },
                child: Container(
                  height: 59,
                  width: 300,
                  color: const Color.fromARGB(255, 255, 251, 254),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "I'm feeling great!",
                          style: TextStyle(
                            fontSize: 21,
                            color: _selectedFeeling == "great"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        if (_selectedFeeling == "great")
                          const Icon(
                            Icons.check,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 340,
              left: 0,
              child: Container(
                height: 3,
                width: 380,
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
            ),
            Positioned(
              top: 360,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  _updateSelectedFeeling("okay");
                },
                child: Container(
                  height: 59,
                  width: 300,
                  color: const Color.fromARGB(255, 255, 251, 254),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "I'm feeling okay",
                          style: TextStyle(
                            fontSize: 21,
                            color: _selectedFeeling == "okay"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        if (_selectedFeeling == "okay")
                          const Icon(
                            Icons.check,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 440,
              left: 0,
              child: Container(
                height: 3,
                width: 380,
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
            ),
            Positioned(
              top: 460,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  _updateSelectedFeeling("bad");
                },
                child: Container(
                  height: 59,
                  width: 300,
                  color: const Color.fromARGB(255, 255, 251, 254),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "I'm feeling bad",
                          style: TextStyle(
                            fontSize: 21,
                            color: _selectedFeeling == "bad"
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        if (_selectedFeeling == "bad")
                          const Icon(
                            Icons.check,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 540,
              left: 0,
              child: Container(
                height: 3,
                width: 380,
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
            ),
            Positioned(
              top: 580,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (_, __, ___) => const SurveyPageThree(),
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
                      "NEXT PAGE",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Back button goes here
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
                    shape: BoxShape.circle,
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
