import 'package:flutter/material.dart';

class AppointmentsCard extends StatelessWidget {
  final DateTime appointmentDate; // Add appointmentDate parameter

  const AppointmentsCard({
    super.key, 
    Key,
    required this.onDelete,
    required this.appointmentDate,
  });

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext cardContext) {
    OverlayEntry? overlayEntry; // Declare overlayEntry variable

    return Container(
      height: 160,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            Color.fromARGB(255, 98, 92, 226),
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
      child: Stack(
        children: [
          const Positioned(
            top: 14,
            left: 20,
            child: AppointmentIcon(),
          ),
          Positioned(
            top: 94,
            left: 14,
            child: AppointmentDate(
                appointmentDate: appointmentDate), // Pass appointmentDate
          ),
          const Positioned(
            top: 94,
            left: 179,
            child: AppointmentTime(),
          ),
          const Positioned(
            top: 14,
            left: 90,
            child: AppointmentDescription(),
          ),
          const Positioned(
            top: 38,
            left: 90,
            child: AppointmentLocation(),
          ),
          Positioned(
            top: 18,
            left: 280,
            child: AppointmentOptionsIcon(
              onDelete: () {
                // Delete the AppointmentsCard
                onDelete();
              },
              onThreeDotTap: () {
                _showThreeDotOptions(cardContext, overlayEntry);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showThreeDotOptions(BuildContext context, OverlayEntry? overlayEntry) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    final Offset iconPosition = overlay.localToGlobal(Offset.zero);

    // Calculate the center position based on the width of the popup
    double popupWidth = -530.0;
    double centeredLeft = iconPosition.dx - popupWidth / 2;

    // Adjust the position to move the popup down and center horizontally
    Offset position = Offset(centeredLeft, iconPosition.dy + 220);

    // Create an overlay entry with the popup positioned at the calculated location
    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Handle tap outside the popup to remove it
              overlayEntry!.remove();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Material(
              color: Colors.transparent,
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle delete action
                        onDelete();
                        overlayEntry!.remove();
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 247, 247),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert the overlay entry to display the popup
    Overlay.of(context).insert(overlayEntry);
  }
}

class AppointmentIcon extends StatelessWidget {
  const AppointmentIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipOval(
        child: Image.asset(
          'images/SeattleChildrensHospital.jpg', // Assuming 'vitals.png' is in the assets folder
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AppointmentDescription extends StatelessWidget {
  const AppointmentDescription({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Physical Check-Up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AppointmentLocation extends StatelessWidget {
  const AppointmentLocation({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Seattle Childrens Hospital",
        style: TextStyle(
          color: Color.fromARGB(255, 214, 214, 214),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AppointmentDate extends StatelessWidget {
  final DateTime appointmentDate;

  const AppointmentDate({Key? key, required this.appointmentDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            _formatDate(appointmentDate),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }
}

class AppointmentTime extends StatelessWidget {
  const AppointmentTime({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.access_time, // Clock icon
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            "12:00 AM",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentOptionsIcon extends StatelessWidget {
  const AppointmentOptionsIcon(
      {super.key, Key, required this.onDelete, required this.onThreeDotTap});

  final VoidCallback onDelete;
  final VoidCallback onThreeDotTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onThreeDotTap,
      child: Container(
        child: const Icon(
          Icons.more_vert,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DateTime> appointments = []; // List to store appointment dates

  @override
  Widget build(BuildContext context) {
    // Determine the latest appointment date
    DateTime latestAppointmentDate = appointments.isNotEmpty
        ? appointments.reduce(
            (value, element) => value.isAfter(element) ? value : element)
        : DateTime.now();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            // Handle tap to dismiss search bar
          },
          child: SingleChildScrollView(
            child: Container(
              height: 1100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 245, 248),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color.fromARGB(255, 233, 233, 233),
                  width: 8.0,
                ),
              ),
              child: Stack(
                children: [
                  // Other widgets...
                  if (appointments.isNotEmpty)
                    Positioned(
                      top: 220,
                      left: 10,
                      child: AppointmentsCard(
                        onDelete: () {
                          setState(() {
                            appointments.removeAt(appointments.length -
                                1); // Remove the latest appointment
                          });
                        },
                        appointmentDate: latestAppointmentDate,
                      ),
                    ),
                  // Other widgets...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
