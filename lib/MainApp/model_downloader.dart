import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

Future<tfl.Interpreter> downloadAndInitializeModel() async {
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

    // Initialize TensorFlow Lite interpreter
    final interpreter = tfl.Interpreter.fromFile(localModelPath);

    // Return the interpreter once initialized
    return interpreter;
  } catch (e) {
    // Handle any errors that occur during download or initialization
    print('Error downloading or initializing model: $e');
    return Future.error('Error downloading or initializing model: $e');
  }
}
