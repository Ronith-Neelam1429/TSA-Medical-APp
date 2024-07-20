import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/SettingsPage/EditProfile.dart';
import 'package:tsa_medapp/MainApp/SettingsPage/EditSecurity.dart';
import 'package:tsa_medapp/MainApp/SettingsPage/Logout.dart';
import 'package:tsa_medapp/MainApp/SettingsPage/Support&Feedback.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Color.fromARGB(255, 98, 92, 226),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 241, 241, 241),
          height: 900,
          width: 420,
          child: const Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 133, 133, 133),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 15,
                child: EditProfile(),
              ),
              Positioned(
                top: 280,
                left: 20,
                child: Text(
                  "Security",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 133, 133, 133),
                  ),
                ),
              ),
              Positioned(
                top: 320,
                left: 15,
                child: EditSecurity(),
              ),
              Positioned(
                top: 540,
                left: 20,
                child: Text(
                  "Support and Feedback",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 133, 133, 133),
                  ),
                ),
              ),
              Positioned(
                top: 580,
                left: 15,
                child: SupportAndFeedback(),
              ),
              Positioned(
                top: 820,
                left: 30,
                child: Logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
