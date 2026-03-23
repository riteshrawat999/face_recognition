import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class ImageController extends GetxController{
  Rx<File?> imageOne = Rx<File?>(null);
  Rx<File?> imageTwo = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> getImagePickerFromGallery(int imageNumber) async {
    final XFile? pickImage = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85,maxWidth: 1000,maxHeight: 1000);
    if (pickImage != null) {
      if(imageNumber ==1){
        imageOne.value = File(pickImage.path);
      }
      else{
        imageTwo.value = File(pickImage.path);
      }
    }
  }

}