import 'package:face_recognition/features/controllers/image_controller.dart';
import 'package:get/get.dart';

import '../controllers/image_compare_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ImageController());
    Get.lazyPut(() => ImageCompareController());
  }

}