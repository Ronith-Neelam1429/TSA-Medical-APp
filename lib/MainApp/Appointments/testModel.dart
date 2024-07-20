/*import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    // Load the TensorFlow Lite model
    _interpreter = await Interpreter.fromAsset('model.tflite');
    // Perform any initialization or setup here
  }

  @override
  Widget build(BuildContext context) {
    // Your UI code here
    return Scaffold(
      appBar: AppBar(
        title: const Text('TFLite Model Loading'),
      ),
      body: const Center(
        child: Text('Model loaded successfully!'),
      ),
    );
  }

  @override
  void dispose() {
    // Release resources when the widget is disposed
    _interpreter.close();
    super.dispose();
  }
}
*/