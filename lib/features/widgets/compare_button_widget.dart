// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// class CompareButtonWidget extends StatelessWidget {
//   const CompareButtonWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
//       child: SizedBox(
//         height: 55,
//         child: Obx(() {
//           final bool isLoading = _compareImageController.isLoading.value;
//           return ElevatedButton.icon(
//             onPressed: isLoading ? null :  () {
//               final img1 = _pickImageController.imageOne.value;
//               final img2 = _pickImageController.imageTwo.value;
//               if (img1 == null || img2 == null) {
//                 Get.snackbar(
//                   "No Image Selected",
//                   "Please select both images",
//                   snackPosition: SnackPosition.BOTTOM,
//                   colorText: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                 );
//                 return;
//               }
//               _compareImageController.compareImages(img1, img2);
//             },
//             icon: isLoading ? CircularProgressIndicator(color: Colors.white,) : Icon(Icons.compare, color: Colors.white),
//             label: Text(
//               'Compare',
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .bodyLarge
//                   ?.copyWith(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xff0055ff),
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
