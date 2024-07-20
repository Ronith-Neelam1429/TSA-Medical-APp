import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/HomePage.dart';

class SurveyPageFour extends StatefulWidget {
  const SurveyPageFour({Key? key}) : super(key: key);

  @override
  _SurveyPageFourState createState() => _SurveyPageFourState();
}

class _SurveyPageFourState extends State<SurveyPageFour>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survey Completed')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.check_circle_outline,
                size: 150,
                color: Colors.green,
              ),
            ),
          ),

          Positioned(
              top: 650,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (_, __, ___) => const HomePage(),
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
        ],
      ),
    );
  }
}
