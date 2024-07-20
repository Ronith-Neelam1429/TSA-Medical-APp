class Illness {
  final String name;
  final List<String> symptoms;

  Illness({required this.name, required this.symptoms});
}

List<Illness> illnesses = [
  Illness(
    name: 'Common Cold',
    symptoms: ['Runny or stuffy nose', 'Sore throat', 'Cough', 'Sneezing'],
  ),
  Illness(
    name: 'Influenza (Flu)',
    symptoms: ['Fever', 'Chills', 'Muscle or body aches', 'Fatigue'],
  ),
  Illness(
    name: 'Asthma',
    symptoms: [
      'Shortness of breath',
      'Wheezing',
      'Coughing',
      'Chest tightness'
    ],
  ),
  Illness(
    name: 'Pneumonia',
    symptoms: ['Cough with phlegm', 'Fever', 'Chills', 'Chest pain'],
  ),
  Illness(
    name: 'Bronchitis',
    symptoms: [
      'Persistent cough',
      'Chest discomfort',
      'Fatigue',
      'Shortness of breath'
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
  ),
  Illness(
    name: 'Gastroenteritis (Stomach Flu)',
    symptoms: ['Nausea', 'Vomiting', 'Diarrhea', 'Abdominal cramps'],
  ),
  Illness(
    name: 'Migraine',
    symptoms: [
      'Severe headache',
      'Nausea or vomiting',
      'Sensitivity to light or sound',
      'Aura'
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
  ),
  Illness(
    name: 'Allergies',
    symptoms: [
      'Sneezing',
      'Runny or stuffy nose',
      'Watery or itchy eyes',
      'Skin rash or hives'
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
  ),
  Illness(
    name: 'Hypertension (High Blood Pressure)',
    symptoms: [
      'Headache',
      'Shortness of breath',
      'Chest pain',
      'Vision problems'
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
  ),
  Illness(
    name: 'Hypothyroidism',
    symptoms: ['Fatigue', 'Weight gain', 'Dry skin', 'Hair loss'],
  ),
  Illness(
    name: 'Arthritis',
    symptoms: [
      'Joint pain',
      'Joint stiffness',
      'Swelling',
      'Redness around the joint'
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
  ),
  Illness(
    name: 'Depression',
    symptoms: [
      'Persistent sadness',
      'Loss of interest or pleasure in activities',
      'Changes in appetite',
      'Sleep disturbances'
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
  ),
  Illness(
    name: 'Insomnia',
    symptoms: [
      'Difficulty falling asleep',
      'Difficulty staying asleep',
      'Waking up too early',
      'Daytime fatigue'
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
  ),
];
