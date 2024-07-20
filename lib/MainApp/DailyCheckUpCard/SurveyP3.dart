import 'package:flutter/material.dart';
import 'package:tsa_medapp/MainApp/DailyCheckUpCard/SurveyP4.dart';
import 'package:tsa_medapp/MainApp/HomePage.dart';
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


class SurveyPageThree extends StatefulWidget {
  const SurveyPageThree({Key? key}) : super(key: key);

  @override
  _SurveyPageThreeState createState() => _SurveyPageThreeState();
}

class _SurveyPageThreeState extends State<SurveyPageThree> {
  final int _currentPage =
      2; // Set initial current page index to 2 (zero-based index)
  final int _numPages = 3; // Set the total number of pages

  // Track the selected feeling

  // Track the entered symptoms for filtering
  String _enteredSymptoms = '';

  // Function to update the entered symptoms
  void _updateEnteredSymptoms(String symptoms) {
    setState(() {
      _enteredSymptoms = symptoms;
    });
  }

  // Function to filter illnesses based on entered symptoms
  List<Illness> _filterIllnesses() {
    if (_enteredSymptoms.isEmpty) {
      return illnesses;
    } else {
      return illnesses.where((illness) {
        return illness.symptoms.any((symptom) =>
            symptom.toLowerCase().contains(_enteredSymptoms.toLowerCase()));
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Illness> filteredIllnesses = _filterIllnesses();

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            const Positioned(
              top: 120,
              left: 22,
              child: Text(
                " What are some symptoms\n      you are experiencing?",
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
            Positioned(
              top: 265,
              left: 22,
              child: Container(
                width: 336,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  onChanged: _updateEnteredSymptoms,
                  decoration: InputDecoration(
                    hintText: 'Search symptoms...',
                    hintStyle: const TextStyle(fontSize: 22),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 8),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Icon(Icons.search, size: 30),
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
              top: 350,
              left: 20,
              child: SizedBox(
                height: 200, // Adjust height as needed
                width: 360, // Adjust width as needed
                child: ListView.builder(
                  itemCount: filteredIllnesses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(filteredIllnesses[index].name),
                      subtitle: Text(
                        filteredIllnesses[index]
                            .symptoms
                            .join(', '),
                      ),
                      onTap: () {
                        // Handle selection of illness
                      },
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 570,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (_, __, ___) => const SurveyPageFour(),
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
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 30,
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