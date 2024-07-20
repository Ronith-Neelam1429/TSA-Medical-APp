import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Vitals extends StatefulWidget {
  const Vitals({
    Key? key,
    required this.updateHeartRate,
    required this.updateStepsCount,
    required Null Function(dynamic value) updateBloodSugarLevel,
  }) : super(key: key);

  final void Function(double value) updateHeartRate;
  final void Function(double value) updateStepsCount;

  @override
  _VitalsState createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> {
  double bloodSugarLevel = 0.5; // Initial blood sugar level
  double stepsCount = 0.0; // Initial steps count
  double heartRate = 0.0; // Initial heart rate
  final TextEditingController _bloodSugarController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();
  final TextEditingController _heartRateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDataFromSharedPreferences();
  }

  _loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bloodSugarLevel = prefs.getDouble('bloodSugarLevel') ?? bloodSugarLevel;
      stepsCount = prefs.getDouble('stepsCount') ?? stepsCount;
      heartRate = prefs.getDouble('heartRate') ?? heartRate;
    });
  }

  _saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('bloodSugarLevel', bloodSugarLevel);
    prefs.setDouble('stepsCount', stepsCount);
    prefs.setDouble('heartRate', heartRate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.blueAccent,
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Color.fromARGB(255, 54, 51, 235)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  title: const Text(
    'Vitals',
    style: TextStyle(color: Colors.white),
  ),
  iconTheme: IconThemeData(color: Colors.white), // Change back arrow color to white
),

      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: 1.0,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            _getProgressColor(bloodSugarLevel)),
                        strokeWidth: 10,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${bloodSugarLevel.toStringAsFixed(1)} mmol/L',
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bloodSugarController,
              decoration: const InputDecoration(
                labelText: 'Enter Blood Sugar Level (mmol/L)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  bloodSugarLevel = double.tryParse(value) ?? 0;
                  _saveDataToSharedPreferences();
                });
              },
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: stepsCount / 10000,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                    _getStepsProgressColor(stepsCount)),
                minHeight: 20,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _stepsController,
              decoration: const InputDecoration(
                labelText: 'Enter Steps Count',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  stepsCount = double.tryParse(value) ?? 0;
                  _saveDataToSharedPreferences();
                });
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: heartRate / 200,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            _getHeartRateColor(heartRate)),
                        strokeWidth: 10,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${heartRate.toStringAsFixed(0)} bpm',
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _heartRateController,
              decoration: const InputDecoration(
                labelText: 'Enter Heart Rate (bpm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  heartRate = double.tryParse(value) ?? 0;
                  _saveDataToSharedPreferences();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getProgressColor(double bloodSugarLevel) {
    if (bloodSugarLevel >= 4.0 && bloodSugarLevel <= 5.9) {
      return Colors.green;
    } else if (bloodSugarLevel >= 3.9 && bloodSugarLevel <= 6.1) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  Color _getStepsProgressColor(double stepsCount) {
    if (stepsCount >= 10000) {
      return Colors.green;
    } else if (stepsCount >= 5000) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  Color _getHeartRateColor(double heartRate) {
    if (heartRate >= 60 && heartRate <= 100) {
      return Colors.green;
    } else if (heartRate >= 50 && heartRate <= 130) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  void dispose() {
    _bloodSugarController.dispose();
    _stepsController.dispose();
    _heartRateController.dispose();
    super.dispose();
  }
}
