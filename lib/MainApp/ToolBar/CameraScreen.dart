import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image/image.dart' as im;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math';

int maxIndex(List<double> output) {
  final resultMap = output.asMap().entries.fold<MapEntry<int, double>?>(
        null,
        (maxEntry, currentEntry) =>
            maxEntry == null || currentEntry.value > maxEntry.value
                ? currentEntry
                : maxEntry,
      );
  return resultMap?.key ??
      0; // Return the index of the max value or 0 if the list is empty
}

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkinCancerDetectorContainer();
  }
}

class SkinCancerDetectorContainer extends StatefulWidget {
  @override
  _SkinCancerDetectorContainerState createState() =>
      _SkinCancerDetectorContainerState();
}

class _SkinCancerDetectorContainerState
    extends State<SkinCancerDetectorContainer> {
  late Interpreter interpreter;
  late Future<void>? _interpreterInitialization;

  @override
  void initState() {
    super.initState();
    _interpreterInitialization = initializeInterpreter();
    downloadAndInitializeModel();
  }

  Future<void> initializeInterpreter() async {
    try {
      final customModel = await FirebaseModelDownloader.instance.getModel(
        "model",
        FirebaseModelDownloadType.localModel,
        FirebaseModelDownloadConditions(
          iosAllowsCellularAccess: true,
          iosAllowsBackgroundDownloading: false,
          androidChargingRequired: false,
          androidWifiRequired: false,
          androidDeviceIdleRequired: false,
        ),
      );

      final localModelPath = customModel.file;
      interpreter = Interpreter.fromFile(localModelPath);
    } catch (e) {
      print('Error initializing interpreter: $e');
    }
  }

  void downloadAndInitializeModel() {
    FirebaseModelDownloader.instance
        .getModel(
      "model", // Replace with your model name
      FirebaseModelDownloadType.localModel,
      FirebaseModelDownloadConditions(
        iosAllowsCellularAccess: true,
        iosAllowsBackgroundDownloading: false,
        androidChargingRequired: false,
        androidWifiRequired: false,
        androidDeviceIdleRequired: false,
      ),
    )
        .then((customModel) {
      final localModelPath = customModel.file;

      // Initialize TensorFlow Lite interpreter
      // ignore: unused_local_variable
      final interpreter = tfl.Interpreter.fromFile(localModelPath);

      // Now the interpreter is initialized and ready for inference
      // You can perform inference with this interpreter
      // ...
    }).catchError((error) {
      print('Error downloading or initializing model: $error');
      // Handle error (e.g., show error message to the user)
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _interpreterInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return CameraScreen(interpreter: interpreter);
        }
      },
    );
  }
}

class CameraScreen extends StatefulWidget {
  final Interpreter interpreter;

  const CameraScreen({Key? key, required this.interpreter}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void>? _initializeControllerFuture;
  late Interpreter interpreter; // Declare the interpreter here
  String? imagePath;
  int selectedCameraIndex = 0;
  List<double> output =
      List.filled(2, 0.0); // 2 categories: Benign and Malignant

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeController();
    _loadModel(); // Call the model loading function here
  }

  // Function to initialize the TensorFlow Lite interpreter
  void _loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset(
          'assets/model.tflite'); // Adjust the path if needed

      // Verify the model's expected input shape
      var inputShape = interpreter.getInputTensor(0).shape;
      print("Model expects input shape: $inputShape");

      // If you need to set any options for the interpreter, you can do so here
      setState(
          () {}); // Call setState if you need to update the UI based on the loading status
    } catch (e) {
      print("Failed to load the model: $e");
    }
  }

  Future<void> _initializeController() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }

    _controller = CameraController(
      cameras[selectedCameraIndex],
      ResolutionPreset.medium,
    );
    return _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> performInference(Uint8List imageBytes) async {
    try {
      // Decode the image from the bytes
      im.Image? image = im.decodeImage(imageBytes);
      if (image == null) {
        return 'Error decoding image';
      }

      // Resize the image to the expected input size of the model (e.g., 224x224 pixels)
      im.Image resizedImage = im.copyResize(image, width: 224, height: 224);

      // Convert the resized image to a Float32List, ensuring it's properly normalized
      Float32List inputTensor = imageToByteListFloat32(resizedImage, 224);

      // Initialize the output tensor with the correct structure for a binary classification model
      // This creates a list containing a single list for the batch, with two elements for the class scores
      List<List<double>> outputTensor =
          List.generate(1, (i) => List.filled(2, 0.0));

      // Run inference
      interpreter.run(inputTensor.buffer.asUint8List(), outputTensor);

      // Access the first (and only) set of results from the output tensor
      List<double> scores = outputTensor.first;

      // Determine the index of the highest score to derive the model's prediction
      int predictionIndex = maxIndex(scores);
      String prediction = predictionIndex == 0 ? 'Benign' : 'Malignant';

      return prediction;
    } catch (e) {
      print('Error performing inference: $e');
      return 'Error';
    }
  }

  Float32List imageToByteListFloat32(im.Image image, int size) {
    var convertedBytes = Float32List(1 * size * size * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        var pixel = image.getPixel(x, y);
        buffer[pixelIndex++] = (im.getRed(pixel) / 255.0);
        buffer[pixelIndex++] = (im.getGreen(pixel) / 255.0);
        buffer[pixelIndex++] = (im.getBlue(pixel) / 255.0);
      }
    }
    return convertedBytes;
  }

  Future<String> getTemporaryImagePath() async {
    final Directory extDir = await getTemporaryDirectory();
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return '${extDir.path}/$timestamp.jpg';
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      // Capture the picture
      XFile file = await _controller.takePicture();

      // Read the captured image file
      List<int> imageBytes = await File(file.path).readAsBytes();

      // Convert the captured image to Image
      im.Image capturedImage = im.decodeImage(Uint8List.fromList(imageBytes))!;

      // Resize the image to 224x224
      im.Image resizedImage =
          im.copyResize(capturedImage, width: 224, height: 224);

      // Convert the resized image to Uint8List
      Uint8List resizedImageBytes =
          Uint8List.fromList(im.encodeJpg(resizedImage));

      // Perform inference with the resized image bytes
      String prediction = await performInference(resizedImageBytes);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Prediction: $prediction'),
      ));

      setState(() {
        imagePath =
            file.path; // Keep the original image path if needed for displaying
      });
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> _switchCamera() async {
    await _controller.dispose();
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    _controller = CameraController(
      cameras[selectedCameraIndex],
      ResolutionPreset.medium,
    );
    setState(() {
      _initializeControllerFuture = _initializeController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Screen')),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _takePicture,
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _switchCamera,
            child: Icon(Icons.switch_camera),
          ),
        ],
      ),
    );
  }
}
