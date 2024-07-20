import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;



class Medication extends StatefulWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  List<String> medications = [];

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _loadMedications();

    // Initialize notification plugin
    tz.initializeTimeZones();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('app_icon'));
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Request permissions
    _requestPermissions();
  }

  // Load medications from local storage
  void _loadMedications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      medications = prefs.getStringList('medications') ?? [];
    });
  }

  // Save medications to local storage
  void _saveMedications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('medications', medications);
  }

  // Function to request notification permissions
  void _requestPermissions() async {
    const AndroidNotificationChannel androidChannel =
        AndroidNotificationChannel(
      'your channel id',
      'your channel name',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Medication',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent, // Make app bar transparent
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Color.fromARGB(255, 93, 64, 255)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(), // Your medication content here
          ..._buildMedicationContainers(),
          Positioned(
            bottom: 26,
            right: 26,
            child: InkWell(
              onTap: () {
                _showMedicationDialog(context);
              },
              child: Container(
                width: 66,
                height: 66,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Color.fromARGB(255, 93, 64, 255)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMedicationDialog(BuildContext context) {
    String medicationName = '';
    String brandName = '';
    TimeOfDay selectedTime = TimeOfDay.now(); // Initialize with current time

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Medication'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter medication name',
                ),
                onChanged: (value) {
                  medicationName = value;
                },
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter brand name',
                ),
                style: const TextStyle(color: Colors.grey), // Grey text color
                onChanged: (value) {
                  brandName = value;
                },
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    hintText: 'Select time',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        // Format the selected time in 12-hour format
                        _formatTime(selectedTime),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String formattedTime =
                    _formatTime(selectedTime); // Format time as needed
                setState(() {
                  medications
                      .add('$medicationName - $brandName - $formattedTime');
                  _saveMedications();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

// Function to format time in 12-hour format
  String _formatTime(TimeOfDay timeOfDay) {
    String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = timeOfDay.hourOfPeriod;
    if (hour == 0) hour = 12; // 12 AM
    return '$hour:${timeOfDay.minute.toString().padLeft(2, '0')} $period';
  }

  Widget _buildMedicationContainer(
      String medicationWithBrand, String time, int index) {
    List<String> parts = medicationWithBrand.split(' - ');
    String medication = parts[0];
    String brand = parts.length > 1 ? parts[1] : '';
    // Extract time if available

    return Container(
      width: 330,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Color.fromARGB(255, 93, 64, 255)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  brand,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 199, 199, 199),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 199, 199, 199),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 13,
              child: SizedBox(
                width: 40,
                height: 40,
                child: PopupMenuButton(
                  icon: const Icon(Icons.more_vert,
                      color: Colors.white, size: 40),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text('Delete'),
                      value: 'delete',
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'delete') {
                      setState(() {
                        medications.removeAt(index);
                        _saveMedications(); // Save medications to local storage
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMedicationContainers() {
    return medications.asMap().entries.map((entry) {
      int index = entry.key;
      String medicationWithBrand = entry.value;
      String time = medicationWithBrand.split(' - ').length > 2
          ? medicationWithBrand.split(' - ')[2]
          : '';

      return Positioned(
        left: 16,
        top: 20 + index * 140,
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              medications.removeAt(index);
              _saveMedications(); // Save medications to local storage
            });
          },
          child: _buildMedicationContainer(medicationWithBrand, time, index),
        ),
      );
    }).toList();
  }
}
