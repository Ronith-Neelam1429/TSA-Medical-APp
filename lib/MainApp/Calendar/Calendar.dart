import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentCalendar extends StatelessWidget {
  const AppointmentCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent, // Set background color
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: _AppointmentCalendar(),
      ),
    );
  }
}

class _AppointmentCalendar extends StatefulWidget {
  const _AppointmentCalendar({Key? key}) : super(key: key);

  @override
  _AppointmentCalendarState createState() => _AppointmentCalendarState();
}

class _AppointmentCalendarState extends State<_AppointmentCalendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  List<Appointment> appointments = [];
  Appointment? selectedAppointment; // New property to store selected appointment

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? savedAppointments = prefs.getStringList('appointments');

    if (savedAppointments != null) {
      setState(() {
        appointments = savedAppointments
            .map((json) => Appointment.fromJson(json))
            .toList();
      });
    }
  }

  Future<void> _saveAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        appointments.map((appointment) => appointment.toJson()).toList();
    await prefs.setStringList('appointments', jsonList);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                selectedAppointment = null; // Reset selected appointment
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            daysOfWeekHeight: 20,
            rowHeight: 40,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 100,
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return buildAppointment(appointment);
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              _showAddEventDialog(context);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget buildAppointment(Appointment appointment) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAppointment = appointment;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.name,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Location: ${appointment.location}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${_formatDate(appointment.dateTime)}, ${_formatTime(appointment.dateTime)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: PopupMenuButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Delete'),
                      onTap: () {
                        _deleteAppointment(appointment);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteAppointment(Appointment appointment) {
    setState(() {
      appointments.remove(appointment);
      _saveAppointments(); // Save updated appointments locally
    });
  }

  void _showAddEventDialog(BuildContext context) async {
    String appointmentName = '';
    DateTime? selectedDateTime = DateTime.now();
    String location = '';

    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Appointment Name',
                  ),
                  onChanged: (value) {
                    appointmentName = value;
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Date: ${_formatDate(selectedDateTime)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDateTime ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDateTime = pickedDate;
                      });
                    }
                  },
                  child: const Text(
                    'Select Date',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Time: ${_formatTime(selectedDateTime)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedDateTime = DateTime(
                          selectedDateTime!.year,
                          selectedDateTime!.month,
                          selectedDateTime!.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                    }
                  },
                  child: const Text(
                    'Select Time',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Location',
                  ),
                  onChanged: (value) {
                    location = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  final newAppointment = Appointment(
                    name: appointmentName,
                    dateTime: selectedDateTime ?? DateTime.now(),
                    location: location,
                  );
                  appointments.add(newAppointment);
                  _saveAppointments(); // Save appointments locally
                });
                Navigator.of(context).pop(true);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );

    if (result != null && result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Event added successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  String _formatDate(DateTime? dateTime) {
    if (dateTime != null) {
      return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
    } else {
      return 'No Date Selected';
    }
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime != null) {
      // Convert DateTime to TimeOfDay
      TimeOfDay timeOfDay = TimeOfDay.fromDateTime(dateTime);

      // Format hour
      String hour = (timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod)
          .toString()
          .padLeft(2, '0');

      // Format minute
      String minute = timeOfDay.minute.toString().padLeft(2, '0');

      // Determine AM/PM
      String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

      // Return formatted time
      return '$hour:$minute $period';
    } else {
      return 'No Time Selected';
    }
  }

  @override
  void dispose() {
    _saveAppointments(); // Save appointments when the widget is disposed
    super.dispose();
  }
}

class Appointment {
  final String name;
  final DateTime dateTime;
  final String location;

  Appointment(
      {required this.name, required this.dateTime, required this.location});

  // Convert Appointment object to JSON string
  String toJson() {
    return '{"name": "$name", "dateTime": "${dateTime.toIso8601String()}", "location": "$location"}';
  }

  // Create Appointment object from JSON string
  factory Appointment.fromJson(String json) {
    final Map<String, dynamic> data =
        Map<String, dynamic>.from(jsonDecode(json));
    return Appointment(
      name: data['name'],
      dateTime: DateTime.parse(data['dateTime']),
      location: data['location'],
    );
  }
}

