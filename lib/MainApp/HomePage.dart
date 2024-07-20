import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:tsa_medapp/MainApp/Appointments/AddAppointment.dart';
import 'package:tsa_medapp/MainApp/Appointments/AppointmentsCard.dart';
import 'package:tsa_medapp/MainApp/Appointments/AppointmentsNav.dart';
import 'package:tsa_medapp/MainApp/DailyCheckUpCard/DaillyCheckUp.dart';
import 'package:tsa_medapp/MainApp/FeelingSickCard/FeelingSickCard.dart';
import 'package:tsa_medapp/MainApp/To-do%20list/NotesCard.dart';
import 'package:tsa_medapp/MainApp/Notifications/Notifications.dart';
import 'package:tsa_medapp/MainApp/ToolBar/CameraCard.dart';
import 'package:tsa_medapp/MainApp/ToolBar/CameraDescription.dart';
import 'package:tsa_medapp/MainApp/ToolBar/MedicationCard.dart';
import 'package:tsa_medapp/MainApp/ToolBar/MedicationDescription.dart';
import 'package:tsa_medapp/MainApp/ToolBar/ToolBarNav.dart';
import 'package:tsa_medapp/MainApp/ToolBar/VitalsCard.dart';
import 'package:tsa_medapp/MainApp/ToolBar/VitalsDescription.dart';

// Define the Illness class
class Illness {
  final String name;
  final List<String> symptoms;
  final List<String> homeRemedies; // New field for home remedies

  Illness(
      {required this.name, required this.symptoms, required this.homeRemedies});
}

// List of illnesses
List<Illness> illnesses = [
  Illness(
    name: 'Common Cold',
    symptoms: ['Runny or stuffy nose', 'Sore throat', 'Cough', 'Sneezing'],
    homeRemedies: [
      'Stay hydrated by drinking plenty of fluids',
      'Get plenty of rest',
      'Gargle with warm salt water',
      'Use saline nasal sprays or drops',
      'Drink hot tea with honey and lemon'
    ],
  ),
  Illness(
    name: 'Influenza (Flu)',
    symptoms: ['Fever', 'Chills', 'Muscle or body aches', 'Fatigue'],
    homeRemedies: [
      'Rest and sleep',
      'Stay hydrated with water, broth, or herbal tea',
      'Use over-the-counter pain relievers for fever and body aches',
      'Take antiviral medications if prescribed by a doctor',
      'Use a humidifier to relieve congestion'
    ],
  ),
  Illness(
    name: 'Asthma',
    symptoms: [
      'Shortness of breath',
      'Wheezing',
      'Coughing',
      'Chest tightness'
    ],
    homeRemedies: [
      'Use a humidifier',
      'Avoid triggers like smoke, dust, and pet dander',
      'Practice breathing exercises',
      'Take prescribed asthma medications',
      'Keep rescue inhaler nearby'
    ],
  ),
  Illness(
    name: 'Pneumonia',
    symptoms: ['Cough with phlegm', 'Fever', 'Chills', 'Chest pain'],
    homeRemedies: [
      'Get plenty of rest',
      'Stay hydrated by drinking fluids',
      'Use over-the-counter pain relievers for fever and pain relief',
      'Take prescribed antibiotics if bacterial pneumonia',
      'Use a humidifier to loosen chest congestion'
    ],
  ),
  Illness(
    name: 'Bronchitis',
    symptoms: [
      'Persistent cough',
      'Chest discomfort',
      'Fatigue',
      'Shortness of breath'
    ],
    homeRemedies: [
      'Stay hydrated',
      'Use a humidifier or take a hot shower to relieve cough',
      'Get plenty of rest',
      'Use over-the-counter cough suppressants',
      'Avoid irritants like smoke and pollutants'
    ],
  ),
  Illness(
    name: 'Urinary Tract Infection (UTI)',
    symptoms: [
      'Frequent urination',
      'Burning sensation during urination',
      'Cloudy or bloody urine',
      'Pelvic pain'
    ],
    homeRemedies: [
      'Drink plenty of water to flush out bacteria',
      'Take over-the-counter pain relievers for pain relief',
      'Urinate frequently to flush out bacteria',
      'Apply a heating pad to relieve pelvic pain',
      'Avoid irritants like caffeine and alcohol'
    ],
  ),
  Illness(
    name: 'Gastroenteritis (Stomach Flu)',
    symptoms: ['Nausea', 'Vomiting', 'Diarrhea', 'Abdominal cramps'],
    homeRemedies: [
      'Stay hydrated by drinking clear fluids like water, broth, and electrolyte solutions',
      'Gradually reintroduce bland foods like bananas, rice, applesauce, and toast (BRAT diet)',
      'Get plenty of rest',
      'Avoid spicy and fatty foods',
      'Take over-the-counter anti-diarrheal medications if necessary'
    ],
  ),
  Illness(
    name: 'Migraine',
    symptoms: [
      'Severe headache',
      'Nausea or vomiting',
      'Sensitivity to light or sound',
      'Aura'
    ],
    homeRemedies: [
      'Rest in a quiet, dark room',
      'Apply a cold compress to the forehead',
      'Take over-the-counter pain relievers',
      'Practice relaxation techniques like deep breathing and meditation',
      'Stay hydrated'
    ],
  ),
  Illness(
    name: 'Conjunctivitis (Pink Eye)',
    symptoms: [
      'Redness in the white of the eye',
      'Swelling of the eyelids',
      'Itching or burning sensation',
      'Discharge from the eye'
    ],
    homeRemedies: [
      'Apply warm compresses to the affected eye',
      'Use over-the-counter lubricating eye drops',
      'Avoid wearing contact lenses until symptoms improve',
      'Wash hands frequently to prevent spreading the infection',
      'Avoid touching or rubbing the affected eye'
    ],
  ),
  Illness(
    name: 'Allergies',
    symptoms: [
      'Sneezing',
      'Runny or stuffy nose',
      'Watery or itchy eyes',
      'Skin rash or hives'
    ],
    homeRemedies: [
      'Avoid allergens whenever possible',
      'Use over-the-counter antihistamines',
      'Use nasal saline sprays or rinses',
      'Keep windows closed during high pollen seasons',
      'Use air purifiers and humidifiers'
    ],
  ),
  Illness(
    name: 'Diabetes',
    symptoms: [
      'Increased thirst',
      'Frequent urination',
      'Extreme hunger',
      'Fatigue'
    ],
    homeRemedies: [
      'Follow a healthy diet plan',
      'Exercise regularly',
      'Monitor blood sugar levels regularly',
      'Take prescribed medications as directed',
      'Manage stress levels'
    ],
  ),
  Illness(
    name: 'Hypertension (High Blood Pressure)',
    symptoms: [
      'Headache',
      'Shortness of breath',
      'Chest pain',
      'Vision problems'
    ],
    homeRemedies: [
      'Maintain a healthy weight',
      'Adopt a low-sodium diet',
      'Exercise regularly',
      'Limit alcohol consumption',
      'Manage stress through relaxation techniques'
    ],
  ),
  Illness(
    name: 'Hyperthyroidism',
    symptoms: [
      'Weight loss',
      'Rapid heartbeat',
      'Irregular heartbeat',
      'Excessive sweating'
    ],
    homeRemedies: [
      'Eat a balanced diet',
      'Limit caffeine intake',
      'Get regular exercise',
      'Manage stress through relaxation techniques',
      'Avoid excessive iodine consumption'
    ],
  ),
  Illness(
    name: 'Hypothyroidism',
    symptoms: ['Fatigue', 'Weight gain', 'Dry skin', 'Hair loss'],
    homeRemedies: [
      'Eat a balanced diet rich in nutrients',
      'Exercise regularly',
      'Get plenty of rest',
      'Take thyroid hormone replacement medication as prescribed',
      'Manage stress levels'
    ],
  ),
  Illness(
    name: 'Arthritis',
    symptoms: [
      'Joint pain',
      'Joint stiffness',
      'Swelling',
      'Redness around the joint'
    ],
    homeRemedies: [
      'Exercise regularly to improve joint flexibility and strength',
      'Apply hot or cold packs to affected joints',
      'Maintain a healthy weight to reduce stress on joints',
      'Use assistive devices like braces and splints',
      'Consider physical therapy'
    ],
  ),
  Illness(
    name: 'Osteoporosis',
    symptoms: [
      'Back pain',
      'Loss of height over time',
      'Stooped posture',
      'Fractures'
    ],
    homeRemedies: [
      'Get regular weight-bearing exercise',
      'Consume adequate calcium and vitamin D',
      'Quit smoking',
      'Limit alcohol consumption',
      'Use assistive devices to prevent falls'
    ],
  ),
  Illness(
    name: 'Depression',
    symptoms: [
      'Persistent sadness',
      'Loss of interest or pleasure in activities',
      'Changes in appetite',
      'Sleep disturbances'
    ],
    homeRemedies: [
      'Stay connected with friends and family',
      'Exercise regularly',
      'Practice relaxation techniques like yoga and meditation',
      'Seek therapy or counseling',
      'Consider medication if prescribed by a doctor'
    ],
  ),
  Illness(
    name: 'Anxiety',
    symptoms: [
      'Excessive worrying',
      'Restlessness',
      'Irritability',
      'Difficulty concentrating'
    ],
    homeRemedies: [
      'Practice deep breathing and relaxation techniques',
      'Exercise regularly',
      'Limit caffeine and alcohol intake',
      'Seek therapy or counseling',
      'Consider medication if prescribed by a doctor'
    ],
  ),
  Illness(
    name: 'Insomnia',
    symptoms: [
      'Difficulty falling asleep',
      'Difficulty staying asleep',
      'Waking up too early',
      'Daytime fatigue'
    ],
    homeRemedies: [
      'Establish a regular sleep schedule',
      'Create a relaxing bedtime routine',
      'Limit exposure to screens before bedtime',
      'Avoid caffeine and heavy meals before bedtime',
      'Consider relaxation techniques like meditation or progressive muscle relaxation'
    ],
  ),
  Illness(
    name: 'Sleep Apnea',
    symptoms: [
      'Loud snoring',
      'Gasping for air during sleep',
      'Daytime sleepiness',
      'Difficulty concentrating'
    ],
    homeRemedies: [
      'Maintain a healthy weight',
      'Sleep on your side instead of your back',
      'Avoid alcohol and sedatives before bedtime',
      'Use a CPAP machine if prescribed by a doctor',
      'Practice good sleep hygiene'
    ],
  ),
];

// Function to print all illness details
void printIllnesses(List<Illness> illnesses) {
  illnesses.forEach((illness) {
    print('Illness: ${illness.name}');
    print('Symptoms: ${illness.symptoms.join(', ')}');
    print('Home Remedies:');
    illness.homeRemedies.forEach((remedy) {
      print('- $remedy');
    });
    print('');
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearchBarVisible = false;
  bool _showAppointmentsCard = true;
  String _searchText = '';
  List<Illness> _filteredIllnesses = [];

  @override
  void initState() {
    super.initState();
    _filteredIllnesses = [...illnesses];
  }

  List<Illness> get filteredIllnesses {
    return _filteredIllnesses;
  }

  set filteredIllnesses(List<Illness> value) {
    _filteredIllnesses = value;
  }

  Widget _buildIllnessList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredIllnesses.length,
        itemBuilder: (context, index) {
          final illness = filteredIllnesses[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  illness.name, // Displaying illness name
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Making text bold
                    color: Colors.red, // Setting text color to red
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Symptoms:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Making "Symptoms:" bold
                  ),
                ),
                const SizedBox(height: 4),
                Text(illness.symptoms.join(", ")),
                const SizedBox(height: 4),
                const Text(
                  'Home Remedies:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Making "Home Remedies:" bold
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: illness.homeRemedies
                      .map((remedy) => Text('- $remedy'))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showIllnessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.black, width: 7.0),
              ),
              elevation: 5,
              child: Container(
                height: 480,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchText = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter symptoms...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _buildIllnessList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _searchText = '';
                          },
                          child: const Text('Close'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _filteredIllnesses = illnesses
                                  .where((illness) => illness.symptoms
                                      .any((symptom) => symptom
                                          .toLowerCase()
                                          .contains(_searchText.toLowerCase())))
                                  .toList();
                            });
                          },
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            if (_isSearchBarVisible) {
              setState(() {
                _isSearchBarVisible = false;
              });
            }
          },
          child: SingleChildScrollView(
            child: Container(
              height: 850,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 0.0,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 360,
                      height: 145,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueAccent,
                            Color.fromARGB(255, 98, 92, 226)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 58,
                    left: 10,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'images/me.jpg', // Assuming 'vitals.png' is in the assets folder
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 53,
                    left: 88,
                    child: Text(
                      "Welcome,",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 202, 202, 202),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 80,
                    left: 88,
                    child: Text(
                      "Ronith",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 275,
                    child: IconButton(
                      onPressed: () {
                        _showIllnessDialog(context);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 50,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 230,
                    child: Notifications(),
                  ),
                  const Positioned(
                    top: 170,
                    left: 10,
                    child: AppointmentsNav(),
                  ),
                  const Positioned(
                    top: 220,
                    left: 90,
                    child: Text("No upcoming appointments"),
                  ),
                  const Positioned(
                    top: 270,
                    left: 130,
                    child: AddAppointment(),
                  ),
                  const Positioned(
                    top: 400,
                    left: 10,
                    child: ToolBarNav(),
                  ),
                  if (_showAppointmentsCard)
                    Positioned(
                      top: 220,
                      left: 10,
                      child: AppointmentsCard(
                        onDelete: () {
                          setState(() {
                            _showAppointmentsCard = false;
                          });
                        },
                        appointmentDate:
                            DateTime.now(), // Provide a valid DateTime object
                      ),
                    ),
                  const Positioned(
                    top: 430,
                    left: 20,
                    child: VitalsCard(),
                  ),
                  const Positioned(
                    top: 530,
                    left: 50,
                    child: VitalsDescription(),
                  ),
                  const Positioned(
                    top: 430,
                    left: 130,
                    child: MedicationCard(),
                  ),
                  const Positioned(
                    top: 530,
                    left: 143,
                    child: MedicationDescription(),
                  ),
                  const Positioned(
                    top: 430,
                    left: 240,
                    child: CameraCard(),
                  ),
                  const Positioned(
                    top: 530,
                    left: 265,
                    child: CameraDescription1(),
                  ),
                  Positioned(
                    top: 580,
                    left: 15,
                    child: GestureDetector(
                      onTap: () {
                        _showIllnessDialog(context);
                      },
                      child: const FeelingSickCard(),
                    ),
                  ),
                  const Positioned(
                    top: 580,
                    left: 190,
                    child: DailyCheckUpCard(),
                  ),
                  const Positioned(
                    top: 705,
                    left: 190,
                    child: NotesCard(),
                  ),
                  if (_isSearchBarVisible)
                    Positioned(
                      top: 58,
                      left: 285,
                      child: GestureDetector(
                        onTap: () {
                          _showIllnessDialog(context);
                        },
                        child: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 50,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
