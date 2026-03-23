import 'package:face_recognition/features/controllers/image_compare_controller.dart';
import 'package:face_recognition/features/widgets/source_image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/image_controller.dart';
import '../widgets/target_image_picker_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImageController _pickImageController = Get.find();
  final ImageCompareController _compareImageController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      appBar: AppBar(
        backgroundColor: Color(0xfff8f9fa),
        title: Text('Compare Faces', style: Theme
            .of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(
            fontSize: 24.0
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                textAlign: TextAlign.center,
                "Upload Two photos to analyze facial similarity.",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  color: Color(0xff4a627a),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First image column
                  SourceImagePickerWidget(
                    containerSize: size.width * 0.42,
                    sourceImageWidget: Obx(() {
                      final file = _pickImageController.imageOne.value;
                      return file == null
                          ? SvgPicture.asset(
                        'assets/images/face.svg',
                        color: Color(0xff949ab0),
                        width: 50,
                        height: 50,
                      )
                          : ClipOval(
                        child: Image.file(
                          _pickImageController.imageOne.value!,
                          fit: BoxFit.cover,
                          cacheWidth: 300,
                          cacheHeight: 300,
                        ),
                      );
                    }),
                    getImageFromGallery: () {
                      _pickImageController.getImagePickerFromGallery(1);
                    },
                  ),
                  // Second image column .. image two
                  TargetImagePickerWidget(
                    containerSize: size.width * 0.42,
                    showImageUsingObxWidget: Obx(() {
                      final file = _pickImageController.imageTwo.value;
                      return file == null
                          ? SvgPicture.asset(
                        'assets/images/person_search.svg',
                        color: Color(0xff949ab0).withOpacity(0.5),
                        width: 50,
                        height: 50,
                      )
                          : ClipOval(
                        child: Image.file(
                          file,
                          fit: BoxFit.cover,
                          cacheWidth: 300,
                          cacheHeight: 300,
                        ),
                      );
                    }),
                    getImageFromGalleryFunctionCall: () {
                      _pickImageController.getImagePickerFromGallery(2);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Elevated Button to compare images
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: SizedBox(
          height: 55,
          child: Obx(() {
            final isLoading = _compareImageController.isLoading.value;
            return ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                final img1 = _pickImageController.imageOne.value;
                final img2 = _pickImageController.imageTwo.value;

                if (img1 == null || img2 == null) {
                  Get.snackbar(
                    "No Image Selected",
                    "Please select both images",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                  );
                  return;
                }

                _compareImageController.compareImages(img1, img2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0055ff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: isLoading
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Comparing...",
                    style : Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.compare, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    "Compare",
                    style : Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),

    );
  }
}
