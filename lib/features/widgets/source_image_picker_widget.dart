import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SourceImagePickerWidget extends StatelessWidget {
  const SourceImagePickerWidget({super.key,required this.containerSize,required this.sourceImageWidget,required this.getImageFromGallery});

  final double containerSize;
  final Widget sourceImageWidget;
  final VoidCallback getImageFromGallery;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: SizedBox(
            width: containerSize,
            height: containerSize,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:const Color(0xffe3e3e7),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:const  Color(0xffffffff),
                        offset: Offset(2, 0),
                        blurRadius: 2,
                        spreadRadius: 5,
                        blurStyle: BlurStyle.solid,
                      ),
                      BoxShadow(
                        color: const Color(0xffffffff),
                        offset: Offset(-2, 0),
                        blurRadius: 2,
                        spreadRadius: 5,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                  ),
                  child: sourceImageWidget,
                ),
                // Positioned
                Positioned(
                  bottom: 5,
                  right: 3,
                  child: InkWell(
                    // Add GestureDetector here source image one
                    borderRadius: BorderRadius.circular(containerSize/2),
                    onTap: getImageFromGallery,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xff00ced1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffffffff),
                            offset: Offset(2, 0),
                            blurRadius: 2,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.solid,
                          ),
                          BoxShadow(
                            color: const Color(0xffffffff),
                            offset: Offset(-2, 0),
                            blurRadius: 2,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.solid,
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/images/add.svg',
                        color: const Color(0xff001f3f),
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Source',
          style: Theme.of(context).textTheme.headlineSmall
              ?.copyWith(
            color: const Color(0xff061041),
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "PRIMARY PHOTO",
          style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: const Color(0xff9ca7b3)),
        ),
      ],
    );
  }
}
