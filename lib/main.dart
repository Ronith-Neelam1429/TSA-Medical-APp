import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tsa_medapp/MainApp/Calendar/Calendar.dart';
import 'package:tsa_medapp/MainApp/To-do%20list/NotesFeature.dart';
import 'package:tsa_medapp/MainApp/SettingsPage/Settings.dart';
import 'MainApp/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePageWithNavBar(),
          );
        }
      },
    );
  }
}

class HomePageWithNavBar extends StatefulWidget {
  const HomePageWithNavBar({Key? key}) : super(key: key);

  @override
  _HomePageWithNavBarState createState() => _HomePageWithNavBarState();
}

class _HomePageWithNavBarState extends State<HomePageWithNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AppointmentCalendar(),
    const NotesPage(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 115, 224),
              Color.fromARGB(255, 17, 61, 143),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: CurvedNavigationBar(
          height: 50,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          color: Colors.transparent,
          buttonBackgroundColor: const Color.fromARGB(255, 189, 87, 87),
          items: <Widget>[
            const Icon(Icons.home, size: 30, color: Colors.white),
            const Icon(Icons.calendar_month, size: 30, color: Colors.white),
            Image.asset(
              'images/notes.png',
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            const Icon(Icons.settings, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
