import 'dart:io';
import 'dart:math';
import 'package:face_recognition/features/model/result_model.dart';
import 'package:face_recognition/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data' as typed;

class ImageCompareController extends GetxController {
  final faceDetector = FaceDetector(
    options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate),
  );

  Interpreter? _interpreter;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  // load the MobileNet.tflite so recognize the face
  void loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/facenet.tflite');
      debugPrint("Model loaded successfully");
    } catch (e) {
      debugPrint("Error loading model : $e");
    }
  }

  Future<List<Face>> detectFaces(File imageFiles) async {
    final inputImage = InputImage.fromFile(imageFiles);
    return await faceDetector.processImage(inputImage);
  }

  Future<List<double>> recognizeFace(img.Image originalImage, Face face) async {
    if (_interpreter == null) return [];
    try {
      int padding = (face.boundingBox.width * 0.15).toInt();
      img.Image cropFaces = img.copyCrop(
        originalImage,
        x: face.boundingBox.left.toInt() + padding,
        y: face.boundingBox.top.toInt() + padding,
        width: face.boundingBox.width.toInt() - (padding * 2),
        height: face.boundingBox.height.toInt() - (padding * 2),
      );
      var input = _imageToBytesList(cropFaces, 160);
      var output = List.filled(1 * 128, 0.0).reshape([1, 128]);
      _interpreter!.run(input, output);
      return List<double>.from(output[0]);
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }

  typed.Uint8List _imageToBytesList(img.Image image, int inputSize) {
    var resizedImage = img.copyResize(
      image,
      width: inputSize,
      height: inputSize,
    );
    var convertedBytes = typed.Float32List(1 * inputSize * inputSize * 3);
    int pixelIndex = 0;
    for (var y = 0; y < inputSize; y++) {
      for (var x = 0; x < inputSize; x++) {
        var pixel = resizedImage.getPixel(x, y);
        convertedBytes[pixelIndex++] = (pixel.r.toDouble() - 127.5) / 127.5;
        convertedBytes[pixelIndex++] = (pixel.g.toDouble() - 127.5) / 127.5;
        convertedBytes[pixelIndex++] = (pixel.b.toDouble() - 127.5) / 127.5;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  double calculateSimilarity(List<double> emb1, List<double> emb2) {
    if (emb1.isEmpty || emb2.isEmpty) return -1.0;

    double s1 = 0, s2 = 0;
    for (int i = 0; i < emb1.length; i++) {
      s1 += emb1[i] * emb1[i];
      s2 += emb2[i] * emb2[i];
    }
    s1 = sqrt(s1);
    s2 = sqrt(s2);

    double distance = 0.0;
    for (int i = 0; i < emb1.length; i++) {
      double normalized1 = emb1[i] / s1;
      double normalized2 = emb2[i] / s2;
      double diff = normalized1 - normalized2;
      distance += diff * diff;
    }
    return sqrt(distance);
  }

  // Calculate Percentage
  double calculatePercentage(double distance) {
    if (distance <= 0.0) return 100.0;

    double score;
    if (distance < 0.85) {
      // Agar distance 0.85 se kam hai, toh score high rehna chahiye
      score = 100 - (distance * 35);
    } else {
      // Agar distance zyada hai, toh score tezi se girega
      score = 100 - (distance * 65);
    }
    return score.clamp(0.0, 100.0);
  }

  //

  // Compare Tow Image
  Future<void> compareImages(File file1, File file2) async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));
      // 1. Detect faces (ML Kit is usually fast as it runs on native side)
      final face1 = await detectFaces(file1);
      final face2 = await detectFaces(file2);

      if (face1.isEmpty || face2.isEmpty) {
        if (Get.isDialogOpen!) Get.back();
        // Close loader
        Get.snackbar(
          'No Face Detected',
          'No human face detected in the image. Please upload clear face image',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),
        );
        return;
      }
      // Background Task
      // using worker thread / isolate / compute
      final img1 = await compute(_decodeTask, file1.readAsBytesSync());
      final img2 = await compute(_decodeTask, file2.readAsBytesSync());

      if (img1 == null || img2 == null) {
        Get.back();
        return;
      }
      // 3. Get embeddings
      final emb1 = await recognizeFace(img1, face1.first);
      final emb2 = await recognizeFace(img2, face2.first);

      // 4. Final Math
      final distance = calculateSimilarity(emb1, emb2);
      final percent = calculatePercentage(distance);

      if (Get.isDialogOpen!) Get.back();

      // dialog which is show result of two image match
      if (percent > 75) {
        Get.offNamed(
          AppRoutes.match,
          arguments: ResultModel(imageOne: file1, imageTwo: file2),
        );
      } else {
        Get.offNamed(
          AppRoutes.notMatch,
          arguments: ResultModel(imageOne: file1, imageTwo: file2),
        );
      }
    } catch (e) {
      if (Get.isDialogOpen!) Get.back();
      debugPrint("Comparison Error: ${e.toString()}");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    faceDetector.close();
    super.dispose();
  }
}

img.Image? _decodeTask(typed.Uint8List bytes) {
  return img.decodeImage(bytes);
}
